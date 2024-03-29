return {
  'mfussenegger/nvim-dap',
  dependencies  = {
  'theHamsta/nvim-dap-virtual-text',
  'jbyuki/one-small-step-for-vimkind'
  },
  keys = function ()
    return require('keymaps.dap')
  end,
  config = function()
    local dap = require 'dap'
    local adapters = require 'plugins.dap.adapters'
    local configurations = require 'plugins.dap.configurations'

    dap.adapters.node2 = adapters.node2
    dap.adapters.nlua = adapters.nlua
    dap.adapters.codelldb = adapters.codelldb

    dap.configurations.javascript = configurations.javascript
    dap.configurations.javascriptreact = configurations.javascript

    dap.configurations.typescript = configurations.javascript
    dap.configurations.typescriptreact = configurations.javascript

    dap.configurations.lua = configurations.lua

    dap.configurations.cpp = configurations.cpp
    dap.configurations.rust = configurations.cpp


    require('dap.ext.vscode').load_launchjs()

    require('nvim-dap-virtual-text').setup {
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = false,
      show_stop_reason = true,
      commented = false,
      only_first_definition = true,
      all_references = false,
      filter_references_pattern = '<module',

      virt_text_pos = 'eol',
      all_frames = false,
      virt_lines = false,
      virt_text_win_col = nil

    }
  end
}
