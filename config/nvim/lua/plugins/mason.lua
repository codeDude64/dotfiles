return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'jay-babu/mason-nvim-dap.nvim',
  },
  config = function()
    local mason                = require 'mason'
    local mason_lspconfig      = require 'mason-lspconfig'
    local mason_tool_installer = require("mason-tool-installer")
    local mason_nvim_dap       = require("mason-nvim-dap")


    mason.setup()
    mason_lspconfig.setup {
      automatic_installation = true
    }
    mason_tool_installer.setup {
      automatic_installation = true,
      ensure_installed = {
        "ts_ls",
        "html",
        "css-lsp",
        "intelephense",
        "pyright",
        "bashls",
        "texlab",
        "yamlls",
        "vimls",
        "dockerls",
        "ruby_lsp",
        "cmake",
        "lemminx",
        "graphql",

        "jsonls",
        "lua_ls",
        "eslint_d",
      }

    }
    mason_nvim_dap.setup { automatic_installation = true }
  end
}
