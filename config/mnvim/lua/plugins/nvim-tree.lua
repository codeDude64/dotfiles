vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
})

vim.keymap.set('n','<c-n>', function ()
  require("nvim-tree.api").tree.toggle({
    path = "<args>",
    find_file = true,
    update_root = true,
    focus = true
  })
end, { noremap = true, silent = true })


---@type nvim_tree.config
local config = {
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}

require("nvim-tree").setup(config)
