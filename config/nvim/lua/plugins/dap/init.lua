return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'jbyuki/one-small-step-for-vimkind',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    'suketa/nvim-dap-ruby',
    'mxsdev/nvim-dap-vscode-js',
  },
  keys = function()
    return require('keymaps.dap')
  end,
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("dapui").setup()
    require("nvim-dap-virtual-text").setup()

    -- Auto open / close UI
    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

    -------------------------------------------------------
    -- mason-nvim-dap
    -------------------------------------------------------
    require("mason-nvim-dap").setup({
      automatic_installation = true,
      handlers = {},
    })

    -------------------------------------------------------
    -- JS / TS with vscode-js-debug
    -------------------------------------------------------
    require('dap-vscode-js').setup({
      debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
    })

    local js_based_languages = {
      "javascript", "javascriptreact",
      "typescript", "typescriptreact",
    }

    for _, lang in ipairs(js_based_languages) do
      dap.configurations[lang] = {
        {
          name = "Launch Node.js",
          type = "pwa-node",
          request = "launch",
          program = "${file}",
          cwd = vim.fn.getcwd(),
        },

        {
          name = "Debug Jest Tests",
          type = "pwa-node",
          request = "launch",
          runtimeExecutable = "node",
          runtimeArgs = { "./node_modules/jest/bin/jest.js", "--runInBand" },
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
      }
    end

    -- React DevServer via Chrome
    dap.configurations.typescriptreact[#dap.configurations.typescriptreact + 1] = {
      name = "Debug React (Chrome)",
      type = "pwa-chrome",
      request = "launch",
      url = "http://localhost:5173",
      webRoot = "${workspaceFolder}",
    }

-------------------------------------------------------
-- Ruby / Rails DAP (FINAL)
-------------------------------------------------------

local dap = require("dap")

-- Use readapt as the debug adapter
dap.adapters.ruby = {
  type = 'executable',
  command = 'readapt',
  args = { 'stdio' },
}

-- DAP configurations
dap.configurations.ruby = {
  -- 1. Generic Ruby debugging
  {
    type = "ruby",
    name = "Run current Ruby file",
    request = "launch",
    program = "${file}",         -- runs the current file
    cwd = "${workspaceFolder}",
  },

  -- 2. Rails Server
  {
    type = "ruby",
    name = "Rails server",
    request = "launch",
    program = "bundle",
    args = { "exec", "rails", "server" },
    cwd = "${workspaceFolder}",
  },

  -- 3. Rails Unit Tests (Minitest)
  {
    type = "ruby",
    name = "Rails tests (minitest)",
    request = "launch",
    program = "bundle",
    args = { "exec", "rails", "test" },
    cwd = "${workspaceFolder}",
  },
}

-- Optionally keep nvim-dap-ruby (recommended)
require("dap-ruby").setup()

    -------------------------------------------------------
    -- Lua (debugging Neovim)
    -------------------------------------------------------
    dap.adapters.nlua = function(callback, config)
      callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
    end

    dap.configurations.lua = {
      {
        type = "nlua",
        request = "attach",
        name = "Attach to running Neovim instance",
      },
    }
  end
}
