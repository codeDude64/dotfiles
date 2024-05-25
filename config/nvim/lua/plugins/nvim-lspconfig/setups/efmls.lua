local lspconfig      = require 'lspconfig'
local default_config = require('plugins.nvim-lspconfig.default_config')
local languages      = require 'plugins.efmls-confing-nvim.languages'

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

return setup_efmls
