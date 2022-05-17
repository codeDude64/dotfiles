local utils = require'chavati.utils'

local setup_mappings = function()
  -- LSP
  utils.key_mapper('n','gh',":lua require'lspsaga.provider'.lsp_finder()<CR>")

  utils.key_mapper('n','<leader>ca',":lua require('lspsaga.codeaction').code_action()<CR>")
  utils.key_mapper('v','<leader>ca',":<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>")
  utils.key_mapper('n','gs',":lua require('lspsaga.signaturehelp').signature_help()<CR>")

  utils.key_mapper('n','K',":lua require('lspsaga.hover').render_hover_doc()<CR>")
  utils.key_mapper('n','<C-a>',":lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>")
  utils.key_mapper('n','<C-q>',":lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>")

  utils.key_mapper('n','<space>rn',":lua require('lspsaga.rename').rename()<CR>")

  utils.key_mapper('n','vd',":lua require'lspsaga.provider'.preview_definition()<CR>")
  utils.key_mapper('n','gd',":lua require('telescope.builtin').lsp_definitions()<CR>")
  utils.key_mapper('n','<leader>gr',":lua require('telescope.builtin').lsp_references()<CR>")

  utils.key_mapper('n','sd',":lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>")
  utils.key_mapper('n','<leader>sd',":lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>")
  utils.key_mapper('n','[e',":lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>")
  utils.key_mapper('n',']e',":lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>")

  utils.key_mapper('n','<A-d>',":lua require('lspsaga.floaterm').open_float_terminal()<CR>")
  utils.key_mapper('t','<A-d>',":<C-\\><C-n>:lua require('lspsaga.floaterm').close_float_terminal()<CR>")


  utils.key_mapper('n','<C-f>',":lua vim.lsp.buf.format{ async = true }<CR>")
  -- Telescope
  utils.key_mapper('n','<c-s>',":lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>")
  utils.key_mapper('n','<s-s>',":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>")
  utils.key_mapper('n','<c-p>',":lua require('telescope.builtin').git_files()<CR>")
  utils.key_mapper('n','<s-p>',":lua require('telescope.builtin').find_files()<CR>")
  utils.key_mapper('n','<leader>gl',":lua require('telescope.builtin').git_commits()<CR>")
  utils.key_mapper('n','<leader>gb',":lua require('telescope.builtin').git_branches()<CR>")
  utils.key_mapper('n','<leader>ts',":lua require('telescope.builtin').treesitter()<CR>")
  utils.key_mapper('n','<leader>to',":lua require('telescope.builtin').builtin()<CR>")
  utils.key_mapper('n','<leader><c-p>',":lua require'telescope'.extensions.repo.list{}<CR>")
  utils.key_mapper('n','<leader><c-n>',":lua require'telescope'.extensions.node_modules.list{}<CR>")
  -- Tree
  utils.key_mapper('n','<c-n>',':NvimTreeToggle<CR>')
  utils.key_mapper('n','<leader>r',':NvimTreeRefresh<CR>')
  utils.key_mapper('n','<leader>n',':NvimTreeFindFile<CR>')

  -- Git
  utils.key_mapper('n','<leader>gs',":lua require('neogit').open()<CR>")
  --Harpoon
  utils.key_mapper('n','<leader>hM',":lua require('harpoon.mark').add_file()<CR>")
  utils.key_mapper('n','<leader>hi',":lua require('harpoon.ui').nav_next()<CR>")
  utils.key_mapper('n','<leader>ho',":lua require('harpoon.ui').nav_prev()<CR>")
  utils.key_mapper('n','<leader>hm',":lua require('harpoon.ui').toggle_quick_menu()<CR>")
  utils.key_mapper('n','<leader>ht',":lua require('harpoon.term').gotoTerminal(1)<CR>")
  utils.key_mapper('n','<leader>hT',":lua require('harpoon.term').gotoTerminal(2)<CR>")

  --resize
  utils.key_mapper('n','<A-l>',":vertical resize +5<CR>")
  utils.key_mapper('n','<A-h>',":vertical resize -5<CR>")
  utils.key_mapper('n','<A-k>',":resize -5<CR>")
  utils.key_mapper('n','<A-j>',":resize +5<CR>")

  --Dap
  utils.key_mapper('n','<F5>',"'lua require'dap'.continue()<CR>")
  utils.key_mapper('n','<F10>',":lua require'dap'.step_over()<CR>")
  utils.key_mapper('n','<F11>',":lua require'dap'.step_into()<CR>")
  utils.key_mapper('n','<F12>',":lua require'dap'.step_out()<CR>")
  utils.key_mapper('n','<leader>b',":lua require'dap'.toggle_breakpoint()<CR>")
  utils.key_mapper('n','<leader>B',":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition:'))<CR>")
  utils.key_mapper('n','<leader>lp',":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message:'))<CR>")
  utils.key_mapper('n','<leader>dr',":lua require'dap'.repl.open()<CR>")
  utils.key_mapper('n','<leader>dl',":lua require'dap'.run_last()<CR>")

end

setup_mappings();
