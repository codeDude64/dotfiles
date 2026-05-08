vim.pack.add({
  {src = 'https://github.com/sindrets/diffview.nvim'}
})

require('diffview').setup()

vim.keymap.set('n', '<leader>hf', ':DiffviewFileHistory %<cr>')

