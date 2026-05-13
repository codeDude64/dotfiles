vim.pack.add({
  { src = 'https://github.com/creativenull/efmls-configs-nvim' }
})

local eslint_d = require 'efmls-configs.linters.eslint_d'
local eslint_d_formatter = require 'efmls-configs.formatters.eslint_d'

local js_languages = { eslint_d, eslint_d_formatter }

local languages = {
  javascript = js_languages,
  javascriptreact = js_languages,
  typescript = js_languages,
  typescriptreact = js_languages,
}

local efmls = {
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

local general = require("plugins.nvim-lspconfig.general")

local config = vim.tbl_extend('force', efmls, general)

vim.lsp.enable('efm')
vim.lsp.config('efm', config)
