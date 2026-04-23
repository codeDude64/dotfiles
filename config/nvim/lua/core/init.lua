vim.g.mapleader = ' '
require("core.options")
require("core.keymaper")
require("core.diagnostic")
require("core.lazy")

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'ruby', 'lua' },
  callback = function() vim.treesitter.start() end,
})

vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'
