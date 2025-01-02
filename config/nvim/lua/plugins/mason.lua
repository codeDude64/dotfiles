return {
  'williamboman/mason.nvim',
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'williamboman/mason-lspconfig.nvim',
    'jay-babu/mason-nvim-dap.nvim'
  },
  config = function()
    local mason                = require 'mason'
    local mason_lspconfig      = require 'mason-lspconfig'
    local mason_tool_installer = require("mason-tool-installer")
    local mason_nvim_dap       = require("mason-nvim-dap")


    mason.setup()
    mason_tool_installer.setup { automatic_installation = true }
    mason_lspconfig.setup { automatic_installation = true }
    mason_nvim_dap.setup { automatic_installation = true }
  end
}
