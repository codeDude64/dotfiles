return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  keys = function()
    return require("keymaps.lsp")
  end,
  dependencies = {
    'hrsh7th/nvim-cmp',
    "onsails/lspkind-nvim",
    "jose-elias-alvarez/null-ls.nvim"
  },
  config = function()
    local lspconfig   = require 'lspconfig'
    local lsp_servers = require 'plugins.nvim-lspconfig.lsp_servers'

    local function load_lsp_servers()
      for server, config in pairs(lsp_servers) do
        lspconfig[server].setup(config)
      end
    end

    load_lsp_servers()
  end
}
