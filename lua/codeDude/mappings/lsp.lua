local telescope_builtin = require 'telescope.builtin'

return {
  { 'n', '<leader>ca', function() vim.lsp.buf.code_action() end },
  { 'n', '<space>rn', function() vim.lsp.buf.rename() end },

  { 'n', 'gs', function() vim.lsp.buf.signature_help() end },
  { 'n', 'K', function() vim.lsp.buf.hover() end },
  { 'n', 'vd', function() vim.lsp.buf.definition() end },
  { 'n', 'gd', function() telescope_builtin.lsp_definitions() end },
  { 'n', 'gr', function() telescope_builtin.lsp_references() end },
  { 'n', 'sd', function() vim.diagnostic.open_float(0, { scope = 'line' }) end },
  { 'n', '<leader>sd', function() vim.diagnostic.open_float(0, { scope = 'cursor' }) end },

  { 'n', '[e', function() vim.diagnostic.goto_prev() end },
  { 'n', ']e', function() vim.diagnostic.goto_next() end },
  { 'n', '[E', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end },
  { 'n', ']E', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end },

  { 'n', '<C-f>', function() vim.lsp.buf.format { async = true } end }
}
