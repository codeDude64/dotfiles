local tree = require 'nvim-tree'

tree.setup {
  sort_by = 'case_sensitive',
  update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
  view = {
    adaptive_size = true,
    mappings = {list = {{key = 'u', action = "dir_up"}}}
  },
  renderer = {group_empty = true},

  filters = {dotfiles = false}

}
