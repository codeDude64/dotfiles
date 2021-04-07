local vim = vim
local utils = require 'chavati.utils'


local setup_mappings = function()
  -- LSP
  utils.key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
  utils.key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
  utils.key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
  utils.key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
  utils.key_mapper('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
  utils.key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
  utils.key_mapper('n', '<leader>ac', ':lua vim.lsp.buf.code_action()<CR>')
  utils.key_mapper('n', '<leader>sd', ':lua vim.lsp.util.show_line_diagnostics()<CR>')
  utils.key_mapper('n', '<c-f>', ':lua vim.lsp.buf.formatting()<CR>')

end

setup_mappings();
