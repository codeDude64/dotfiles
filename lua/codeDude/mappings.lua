local utils = require 'codeDude.utils'
local ls = require 'luasnip'
local telescope = require 'telescope'
local telescope_builtin = require 'telescope.builtin'
local neogit = require 'neogit'
local harpoon_mark = require 'harpoon.mark'
local harpoon_ui = require 'harpoon.ui'
local harpoon_term = require 'harpoon.term'
local dap = require 'dap'

local mappings = {
  -- LSP
  { 'n', '<leader>ca', function() vim.lsp.buf.code_action() end },
  { 'n', '<space>rn', function() vim.lsp.buf.rename() end },

  { 'n', 'gs', function() vim.lsp.buf.signature_help() end },
  { 'n', 'K', function() vim.lsp.buf.hover() end },
  { 'n', 'vd', function() vim.lsp.buf.definition() end },
  { 'n', 'gd', function() telescope_builtin.lsp_definitions() end },
  { 'n', 'gr', function() telescope_builtin.lsp_references() end },
  { 'n', 'sd', function() vim.diagnostic.open_float(0, { scope = 'line' }) end },
  { 'n', '<leader>sd', function() vim.diagnostic.open_float(0, { scope = 'cursor' }) end },

  { 'n', '[e', function() vim.diagnostic.goto_prev() end },
  { 'n', ']e', function() vim.diagnostic.goto_next() end },
  { 'n', '[E', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end },
  { 'n', ']E', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end },

  { 'n', '<C-f>', function() vim.lsp.buf.format { async = true } end },
  -- Telescope
  { 'n', '<c-s>', function() telescope_builtin.grep_string { search = vim.fn.expand('<cword>') } end },
  { 'n', '<s-s>', function() telescope_builtin.grep_string({ search = vim.fn.input('Grep For > ') }) end },
  { 'n', '<c-p>', function() telescope_builtin.git_files() end },
  { 'n', '<s-p>', function() telescope_builtin.find_files({ no_ignore = true }) end },
  { 'n', 'gl', function() telescope_builtin.git_commits() end },
  { 'n', 'gb', function() telescope_builtin.git_branches() end },
  { 'n', '<leader>ts', function() telescope_builtin.treesitter() end },
  { 'n', '<leader>to', function() telescope_builtin.builtin() end },
  { 'n', '<leader><c-p>', function() telescope.extensions.repo.list {} end },
  { 'n', '<leader><c-n>', function() telescope.extensions.node_modules.list {} end },
  -- Tree
  { 'n', '<c-n>', ':NvimTreeToggle<CR>' },
  { 'n', '<leader>r', ':NvimTreeRefresh<CR>' },
  { 'n', '<leader>n', ':NvimTreeFindFile<CR>' },

  -- Git
  { 'n', '<leader>gs', function() neogit.open() end },
  --Harpoon
  { 'n', '<leader>hM', function() harpoon_mark.add_file() end },
  { 'n', '<leader>hi', function() harpoon_ui.nav_next() end },
  { 'n', '<leader>ho', function() harpoon_ui.nav_prev() end },
  { 'n', '<leader>hm', function() harpoon_ui.toggle_quick_menu() end },
  { 'n', '<leader>ht', function() harpoon_term.gotoTerminal(1) end },
  { 'n', '<leader>hT', function() harpoon_term.gotoTerminal(2) end },

  --resize
  { 'n', '<A-l>', function() vim.cmd.resize({ args = { '+5' }, mods = { vertical = true } }) end },
  { 'n', '<A-h>', function() vim.cmd.resize({ args = { '-5' }, mods = { vertical = true } }) end },
  { 'n', '<A-k>', function() vim.cmd.resize({ args = { '-5' } }) end },
  { 'n', '<A-j>', function() vim.cmd.resize({ args = { '+5' } }) end },
  --Luasnip
  { 'i', '<C-l>', function()
    if ls.choice_active() then
      ls.change_choice()
    end
  end },
  --Dap
  { 'n', '<F5>', function() dap.continue() end },
  { 'n', '<F10>', function() dap.step_over() end },
  { 'n', '<F11>', function() dap.step_into() end },
  { 'n', '<F12>', function() dap.step_out() end },
  { 'n', '<leader>b', function() dap.toggle_breakpoint() end },
  { 'n', '<leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition:')) end },
  { 'n', '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message:')) end },
  { 'n', '<leader>dr', function() dap.repl.open() end },
  { 'n', '<leader>dl', function() dap.run_last() end },

}

local function setup_mappings(maps)
  for _, map in ipairs(maps) do
    local mode, key, result, opts = map[1], map[2], map[3], map[4]

    utils.key_mapper(mode, key, result, opts)
  end

end

setup_mappings(mappings);
