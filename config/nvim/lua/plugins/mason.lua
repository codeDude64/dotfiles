return {
  'mason-org/mason.nvim',
  dependencies = {
    'mason-org/mason-lspconfig.nvim',
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
      automatic_installation = true,
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "intelephense",
        "pyright",
        "bashls",
        "texlab",
        "yamlls",
        "vimls",
        "dockerls",
        "cmake",
        "lemminx",
        "graphql",
        "jsonls",
        "lua_ls",
      }
    }
    mason_tool_installer.setup {
      auto_update = true,
      ensure_installed = {
        "eslint_d",
      }

    }
    mason_nvim_dap.setup { automatic_installation = true, ensure_installed = { "js-debug-adapter", "rdbg" } }
  end
}
