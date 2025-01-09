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

  local lsp_fmt_group = vim.api.nvim_create_augroup('LspFormattingGroup', {})
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = lsp_fmt_group,
    callback = function(ev)
      local efm = vim.lsp.get_clients({ name = 'efm', bufnr = ev.buf })

      if vim.tbl_isempty(efm) then
        return
      end

      vim.lsp.buf.format({ name = 'efm' })
    end,
  })
end

return setup_efmls
