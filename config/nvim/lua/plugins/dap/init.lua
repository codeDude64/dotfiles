return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'jbyuki/one-small-step-for-vimkind',
    'nvim-neotest/nvim-nio',
    'williamboman/mason.nvim',
    'suketa/nvim-dap-ruby',
    'mxsdev/nvim-dap-vscode-js',
    'jbyuki/one-small-step-for-vimkind'
  },
  keys = function()
    return require('keymaps.dap')
  end,
  config = function()
    local dap = require 'dap'
    local ui = require 'dapui'


    local adapters = require 'plugins.dap.adapters'
    local configurations = require 'plugins.dap.configurations'

    ui.setup {}
    require('dap-ruby').setup()
    require("dap-vscode-js").setup({
      adapters = adapters.javascriptTypescript,
    })

    for _, language in ipairs({ "typescript", "javascript" }) do
      dap.configurations[language] = configurations.javascriptTypescript
    end

    dap.adapters.nlua = adapters.nlua

    dap.configurations = configurations.nlua

    dap.adapters.gbd = adapters.gbd

    dap.configurations.c = configurations.c
    dap.configurations.cpp = configurations.c

    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.open()
    end
  end
}
