vim.pack.add({
  { src = 'https://github.com/arakkkkk/kanban.nvim' }
})

local kanban = require('kanban')

kanban.setup({
  markdown = {
    description_folder = "./task/",
    list_head = "## "
  }
})
