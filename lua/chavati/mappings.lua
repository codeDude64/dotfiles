local utils = require'chavati.utils'

local mappings = {
  -- LSP
  {'n','<leader>ca',":lua vim.lsp.buf.code_action()<CR>"},
  {'n','<space>rn',":lua vim.lsp.buf.rename()<CR>"},

  {'n','gs',":lua vim.lsp.buf.signature_help()<CR>"},
  {'n','K',":lua vim.lsp.buf.hover()<CR>"},
  {'n','vd',":lua vim.lsp.buf.preview_definition()<CR>"},
  {'n','gd',":lua require('telescope.builtin').lsp_definitions()<CR>"},
  {'n','<leader>gr',":lua require('telescope.builtin').lsp_references()<CR>"},
  {'n','sd',":lua vim.diagnostic.open_float(0, {scope = 'line'})<CR>"},
  {'n','<leader>sd',":lua vim.diagnostic.open_float(0, {scope = 'cursor'})<CR>"},

  {'n','[e',":lua vim.diagnostic.goto_prev()<CR>"},
  {'n',']e',":lua vim.diagnostic.goto_next()<CR>"},
  {'n','[E',":lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>"},
  {'n',']E',":lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>"},

  {'n','<C-f>',":lua vim.lsp.buf.format{ async = true }<CR>"},
  -- Telescope
  {'n','<c-s>',":lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>"},
  {'n','<s-s>',":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>"},
  {'n','<c-p>',":lua require('telescope.builtin').git_files()<CR>"},
  {'n','<s-p>',":lua require('telescope.builtin').find_files({ no_ignore = true })<CR>"},
  {'n','<leader>gl',":lua require('telescope.builtin').git_commits()<CR>"},
  {'n','<leader>gb',":lua require('telescope.builtin').git_branches()<CR>"},
  {'n','<leader>ts',":lua require('telescope.builtin').treesitter()<CR>"},
  {'n','<leader>to',":lua require('telescope.builtin').builtin()<CR>"},
  {'n','<leader><c-p>',":lua require'telescope'.extensions.repo.list{}<CR>"},
  {'n','<leader><c-n>',":lua require'telescope'.extensions.node_modules.list{}<CR>"},
  -- Tree
  {'n','<c-n>',':NvimTreeToggle<CR>'},
  {'n','<leader>r',':NvimTreeRefresh<CR>'},
  {'n','<leader>n',':NvimTreeFindFile<CR>'},

  -- Git
  {'n','<leader>gs',":lua require('neogit').open()<CR>"},
  --Harpoon
  {'n','<leader>hM',":lua require('harpoon.mark').add_file()<CR>"},
  {'n','<leader>hi',":lua require('harpoon.ui').nav_next()<CR>"},
  {'n','<leader>ho',":lua require('harpoon.ui').nav_prev()<CR>"},
  {'n','<leader>hm',":lua require('harpoon.ui').toggle_quick_menu()<CR>"},
  {'n','<leader>ht',":lua require('harpoon.term').gotoTerminal(1)<CR>"},
  {'n','<leader>hT',":lua require('harpoon.term').gotoTerminal(2)<CR>"},

  --resize
  {'n','<A-l>',":vertical resize +5<CR>"},
  {'n','<A-h>',":vertical resize -5<CR>"},
  {'n','<A-k>',":resize -5<CR>"},
  {'n','<A-j>',":resize +5<CR>"},

  --Dap
  {'n','<F5>',"'lua require'dap'.continue()<CR>"},
  {'n','<F10>',":lua require'dap'.step_over()<CR>"},
  {'n','<F11>',":lua require'dap'.step_into()<CR>"},
  {'n','<F12>',":lua require'dap'.step_out()<CR>"},
  {'n','<leader>b',":lua require'dap'.toggle_breakpoint()<CR>"},
  {'n','<leader>B',":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition:'))<CR>"},
  {'n','<leader>lp',":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message:'))<CR>"},
  {'n','<leader>dr',":lua require'dap'.repl.open()<CR>"},
  {'n','<leader>dl',":lua require'dap'.run_last()<CR>"},

}

local function setup_mappings(maps )
  for  _ , map in ipairs(maps) do
    local mode = tostring(map[1])
    local key = tostring(map[2])
    local result = tostring(map[3])

    utils.key_mapper(mode, key, result)
  end

end

setup_mappings(mappings);
