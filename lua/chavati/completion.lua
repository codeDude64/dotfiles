local vim = vim

vim.g.completeopt={ 'menuone','noinsert','noselect' }
vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_insert_delay = 1
vim.g.completion_chain_complete_list = {
  {complete_items = {'lsp', 'snippet'}},
  {mode = '<c-p>'},
  {mode = '<c-n>'},
}

vim.g.completion_enable_snippet = 'UltiSnips'
vim.g.completion_trigger_character = { '.', '::' }
