vim.g.mapleader = ' '
require("core.options")
require("core.globals")
require("core.keymaper")
require("core.diagnostic")
require("core.lazy")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "ruby",
  callback = function()
    -- This ensures that every time a Ruby file opens, 
    -- we strip the dot from the trigger list.
    vim.opt_local.indentkeys:remove('.')
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'ruby', 'lua' },
  callback = function() vim.treesitter.start() end,
})

vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'

vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
