return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  keys = function()
    return require("keymaps.nvim-lspconfig")
  end,
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'hrsh7th/nvim-cmp',
    "onsails/lspkind-nvim",
    "creativenull/efmls-configs-nvim"
  },
  config = function()
    local lspconfig       = require 'lspconfig'
    local lsp_servers     = require 'plugins.nvim-lspconfig.lsp_servers'
    local mason           = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require("mason-tool-installer")
    local default_config  = require('plugins.nvim-lspconfig.default_config')
    local languages       = require 'plugins.efmls-confing-nvim.languages'


    local function load_lsp_servers()
      for server, config in pairs(lsp_servers) do
        lspconfig[server].setup(config)
      end
    end

    local function setup_efmls()
      local efmls_config = {
        filetypes = vim.tbl_keys(languages),
        settings = {
          rootMarkers = { '.git/' },
          languages = languages,
        },
        init_options = {
          documentFormatting = true,
          documentRangeFormatting = true,
        },
      }

      local efml_configs = vim.tbl_extend('force', efmls_config, default_config)

      lspconfig.efm.setup(efml_configs)
    end

    mason.setup()
    mason_tool_installer.setup{ automatic_installation = true }
    mason_lspconfig.setup { automatic_installation = true }

    load_lsp_servers()
    setup_efmls()
  end
}
