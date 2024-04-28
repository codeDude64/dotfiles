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
  },
  config = function()
    local lspconfig   = require 'lspconfig'
    local lsp_servers = require 'plugins.nvim-lspconfig.lsp_servers'
    local mason_lspconfig = require 'mason-lspconfig'
    
    mason_lspconfig.setup{ automatic_installation = true }

    local function load_lsp_servers()
      for server, config in pairs(lsp_servers) do
        lspconfig[server].setup(config)
      end
    end

    load_lsp_servers()
  end
}
