return {
  { '<leader>ca', function() vim.lsp.buf.code_action() end },
  { '<space>rn',  function() vim.lsp.buf.rename() end },

  { 'gs',         function() vim.lsp.buf.signature_help() end },
  { 'K',          function() vim.lsp.buf.hover() end },
  { 'gd',         function() vim.lsp.buf.definition() end },
  { 'gr',         function() vim.lsp.buf.references() end },
  { 'sd',         function() vim.diagnostic.open_float(0, { scope = 'line' }) end },
  { '<leader>sd', function() vim.diagnostic.open_float(0, { scope = 'cursor' }) end },
  { '[e',         function() vim.diagnostic.goto_prev() end },
  { ']e',         function() vim.diagnostic.goto_next() end },
  { '[E',         function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end },
  { ']E',         function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end },
  { '<C-f>',      function() vim.lsp.buf.format { async = true } end }
}
