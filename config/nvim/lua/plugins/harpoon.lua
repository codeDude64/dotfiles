vim.pack.add({
  { src = 'https://github.com/ThePrimeagen/harpoon', version = 'harpoon2' }
})

local harpoon = require('harpoon')

harpoon:setup({
  settings = {
    save_on_toggle = true
  }
})

vim.keymap.set('n','<leader>hM', function() harpoon:list():add()  end)
vim.keymap.set('n','<leader>hi', function() harpoon:list():next() end)
vim.keymap.set('n','<leader>ho', function() harpoon:list():prev() end)
vim.keymap.set('n','<leader>hm', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
