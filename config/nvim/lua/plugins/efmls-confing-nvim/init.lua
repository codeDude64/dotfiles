return {
  'creativenull/efmls-configs-nvim',
  dependencies = { 'neovim/nvim-lspconfig' },
  config = function()
    local lspconfig   = require 'lspconfig'
    local default_config = require('plugins.nvim-lspconfig.default_config')
    local languages = require 'plugins.efmls-confing-nvim.languages'

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

    local config = vim.tbl_extend('force', efmls_config, default_config)

    lspconfig.efm.setup(config)

  end
}
