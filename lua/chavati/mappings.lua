local vim = vim
local utils = require 'chavati.utils'


local setup_mappings = function()
  -- LSP
  utils.key_mapper("n","<silent>gh",":lua require'lspsaga.provider'.lsp_finder()<CR>")

  utils.key_mapper("n","<leader>ca",":lua require('lspsaga.codeaction').code_action()<CR>")
  utils.key_mapper("v","<leader>ca",":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>")

  utils.key_mapper("n","<silent>K",":lua require('lspsaga.hover').render_hover_doc()<CR>")
  utils.key_mapper("n","<silent><C-f>",":lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
  utils.key_mapper("n","<silent><C-b>",":lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

  utils.key_mapper("n","<leader>gs",":lua require('lspsaga.signaturehelp').signature_help()<CR>")

  utils.key_mapper("n","<leader>rn",":lua require('lspsaga.rename').rename()<CR>")

  utils.key_mapper("n","<leader>gd",":lua require'lspsaga.provider'.preview_definition()<CR>")

  utils.key_mapper("n","<silent><leader>cd",":lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>")
  utils.key_mapper("n","<silent><leader>cc",":lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>")
  utils.key_mapper("n","<silent>[e",":lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>")
  utils.key_mapper("n","<silent>]e",":lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>")

  utils.key_mapper("n","<silent><A-d>",":lua require('lspsaga.floaterm').open_float_terminal()<CR>")
  utils.key_mapper("t","<silent><A-d> ",":<C-\\><C-n>lua require('lspsaga.floaterm').close_float_terminal()<CR>")
  -- Completion
  vim.cmd[[inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"]]
  vim.cmd[[inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"]]
  vim.cmd[[inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]]
  vim.cmd[[imap <tab> <Plug>(completion_smart_tab)]]
  vim.cmd[[imap <s-tab> <Plug>(completion_smart_s_tab)]]
  -- Snippets
  utils.key_mapper('i', '<c-k>', ":lua require'snippets'.expand_or_advance(1)<CR>")
  utils.key_mapper('i', '<c-j>', ":lua require'snippets'.advance_snippet(-1)<CR>")
  vim.cmd[[imap <c-j> <Plug>(completion_next_source)]]
  vim.cmd[[imap <c-k> <Plug>(completion_prev_source)]]
  -- Telescope
  vim.cmd[[nnoremap <c-s> :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>]]
  vim.cmd[[nnoremap <s-s> :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>]]
  vim.cmd[[nnoremap <c-p> :lua require('telescope.builtin').git_files()<CR>]]
  vim.cmd[[nnoremap <s-p> :lua require('telescope.builtin').find_files()<CR>]]
  vim.cmd[[nnoremap <leader>gl :lua require('telescope.builtin').git_commits()<CR>]]
  vim.cmd[[nnoremap <leader>gb :lua require('telescope.builtin').git_branches()<CR>]]
  -- Tree
  vim.cmd[[nnoremap <c-n> :NvimTreeToggle<CR>]]
  vim.cmd[[nnoremap <leader>r :NvimTreeRefresh<CR>]]
  vim.cmd[[nnoremap <leader>n :NvimTreeFindFile<CR>]]
  -- Git
  vim.cmd[[nnoremap <leader>gs :G<CR>]]
  vim.cmd[[nnoremap <leader>gj :diffget //3<CR>]]
  vim.cmd[[nnoremap <leader>gf :diffget //2<CR>]]

end

setup_mappings();
