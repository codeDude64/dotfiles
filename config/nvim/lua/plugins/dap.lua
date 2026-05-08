-- ── 1. PLUGINS ──────────────────────────────────────────────────────────────

-- Hook for vscode-js-debug: build automatically on install/update
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'vscode-js-debug' then
      if ev.data.kind == 'install' or ev.data.kind == 'update' then
        vim.system(
          { 'bash', '-c', 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out' },
          { cwd = ev.data.path }
        )
      end
    end
  end,
})

vim.pack.add({
  { src = 'https://github.com/nvim-neotest/nvim-nio' },
  { src = 'https://github.com/mfussenegger/nvim-dap' },
  { src = 'https://github.com/rcarriga/nvim-dap-ui' },
  { src = 'https://github.com/theHamsta/nvim-dap-virtual-text' },
  { src = 'https://github.com/jbyuki/one-small-step-for-vimkind' },   -- Lua DAP
  { src = 'https://github.com/suketa/nvim-dap-ruby' },                 -- Ruby helper
  { src = 'https://github.com/microsoft/vscode-js-debug', name = 'vscode-js-debug' },
})

-- ── 2. LOCAL VARIABLES ──────────────────────────────────────────────────────

local dap = require('dap')
local dapui = require('dapui')

-- ── 3. DAP-UI ───────────────────────────────────────────────────────────────

dapui.setup({
  icons = { expanded = '▾', collapsed = '▸', current_frame = '▸' },
  layouts = {
    {
      elements = {
        { id = 'scopes',      size = 0.4 },
        { id = 'breakpoints', size = 0.2 },
        { id = 'stacks',      size = 0.2 },
        { id = 'watches',     size = 0.2 },
      },
      size = 40,
      position = 'left',
    },
    {
      elements = {
        { id = 'repl',    size = 0.5 },
        { id = 'console', size = 0.5 },
      },
      size = 10,
      position = 'bottom',
    },
  },
})

-- Open/close UI automatically when session starts/ends
dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

-- ── 4. VIRTUAL TEXT ─────────────────────────────────────────────────────────

require('nvim-dap-virtual-text').setup({
  enabled = true,
  display_callback = function(variable, buf, stackframe, node, options)
    if options.virt_text_pos == 'inline' then
      return ' = ' .. variable.value
    else
      return variable.name .. ' = ' .. variable.value
    end
  end,
})

-- ── 5. ADAPTERS ─────────────────────────────────────────────────────────────

-- ── Ruby ─────────────────────────────────────────────────────────────────────
-- nvim-dap-ruby sets up the adapter automatically using readapt
require('dap-ruby').setup()

-- ── Lua ──────────────────────────────────────────────────────────────────────
dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host or '127.0.0.1', port = config.port or 8086 })
end

-- ── JS/TS: configure adapter directly (without nvim-dap-vscode-js) ───────────
local js_debug_path = vim.fn.stdpath('data') .. '/site/pack/core/opt/vscode-js-debug'

for _, adapter in ipairs({ 'pwa-node', 'pwa-chrome', 'node-terminal', 'pwa-extensionHost' }) do
  dap.adapters[adapter] = {
    type = 'server',
    host = '127.0.0.1',
    port = '${port}',
    executable = {
      command = 'node',
      args = {
        js_debug_path .. '/out/src/vsDebugServer.js',
        '${port}',
      },
    },
  }
end

-- ── C/C++ with codelldb ───────────────────────────────────────────────────────
dap.adapters.codelldb = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'codelldb',   -- must be in your PATH (yay -S codelldb)
    args = { '--port', '${port}' },
  },
}

-- ── 6. CONFIGURATIONS ───────────────────────────────────────────────────────

-- ── Ruby ─────────────────────────────────────────────────────────────────────
-- nvim-dap-ruby already registers a basic dap.configurations.ruby.
-- Extend it with additional configs:
dap.configurations.ruby = vim.list_extend(dap.configurations.ruby or {}, {
  {
    type = 'ruby',
    name = 'Rails server',
    request = 'launch',
    program = 'bundle',
    programArgs = { 'exec', 'rails', 's' },
    useBundler = true,
  },
  {
    type = 'ruby',
    name = 'RSpec — current file',
    request = 'launch',
    program = 'bundle',
    programArgs = { 'exec', 'rspec', '${file}' },
    useBundler = true,
  },
  {
    type = 'ruby',
    name = 'RSpec — full suite',
    request = 'launch',
    program = 'bundle',
    programArgs = { 'exec', 'rspec' },
    useBundler = true,
  },
})

-- ── Lua ──────────────────────────────────────────────────────────────────────
dap.configurations.lua = {
  {
    type = 'nlua',
    request = 'attach',
    name = 'Attach to Neovim',
    host = '127.0.0.1',
    port = function()
      local val = tonumber(vim.fn.input('Port: '))
      assert(val, 'Port required')
      return val
    end,
  },
}

-- ── JS / TS / TSX ────────────────────────────────────────────────────────────
local js_configs = {
  {
    type = 'pwa-node',
    request = 'launch',
    name = 'Launch Node file',
    program = '${file}',
    cwd = '${workspaceFolder}',
  },
  {
    type = 'pwa-node',
    request = 'attach',
    name = 'Attach to Node process',
    processId = require('dap.utils').pick_process,
    cwd = '${workspaceFolder}',
  },
  {
    type = 'pwa-node',
    request = 'launch',
    name = 'Debug Jest',
    runtimeExecutable = 'node',
    runtimeArgs = { './node_modules/jest/bin/jest.js', '--runInBand' },
    rootPath = '${workspaceFolder}',
    cwd = '${workspaceFolder}',
    console = 'integratedTerminal',
    internalConsoleOptions = 'neverOpen',
  },
  {
    type = 'pwa-chrome',
    request = 'launch',
    name = 'Open Chrome (localhost:3000)',
    url = 'http://localhost:3000',
    webRoot = '${workspaceFolder}',
  },
}

for _, lang in ipairs({ 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' }) do
  dap.configurations[lang] = js_configs
end

-- ── C ────────────────────────────────────────────────────────────────────────
dap.configurations.c = {
  {
    type = 'codelldb',
    request = 'launch',
    name = 'Launch executable',
    program = function()
      return vim.fn.input('Executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

-- C++ shares the same configs as C
dap.configurations.cpp = dap.configurations.c

-- ── 7. KEYMAPS ──────────────────────────────────────────────────────────────

local map = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { desc = 'DAP: ' .. desc })
end

-- Execution
map('<F5>',       dap.continue,          'Continue / Start')
map('<F10>',      dap.step_over,         'Step Over')
map('<F11>',      dap.step_into,         'Step Into')
map('<F12>',      dap.step_out,          'Step Out')
map('<leader>dq', dap.terminate,         'Terminate session')

-- Breakpoints
map('<leader>db', dap.toggle_breakpoint, 'Toggle breakpoint')
map('<leader>dB', function()
  dap.set_breakpoint(vim.fn.input('Condition: '))
end, 'Conditional breakpoint')
map('<leader>dl', function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log message: '))
end, 'Logpoint')

-- UI
map('<leader>du', dapui.toggle, 'Toggle UI')
map('<leader>de', dapui.eval,   'Evaluate expression')

-- REPL
map('<leader>dr', dap.repl.open, 'Open REPL')

-- Lua specific (one-small-step-for-vimkind)
map('<leader>dL', function()
  require('osv').launch({ port = 8086 })
end, 'Start Lua DAP server')
