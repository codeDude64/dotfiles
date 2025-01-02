return {
  "neovim/nvim-lspconfig",
  event = "BufReadPre",
  keys = function()
    return require("keymaps.nvim-lspconfig")
  end,
  dependencies = {
    'hrsh7th/nvim-cmp',
    "creativenull/efmls-configs-nvim"
  },
  config = function()
    local setup_lsp_servers = require 'plugins.nvim-lspconfig.setups.lsp_servers'
    local setup_efmls        = require 'plugins.nvim-lspconfig.setups.efmls'

    setup_lsp_servers()
    setup_efmls()
  end
}
