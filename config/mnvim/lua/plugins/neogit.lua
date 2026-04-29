vim.pack.add({
  { src = 'https://github.com/m00qek/baleia.nvim' },
  { src = 'https://github.com/NeogitOrg/neogit' }
})

require('neogit').setup()

vim.keymap.set('n', '<leader>gs', "<cmd>Neogit<cr>")
