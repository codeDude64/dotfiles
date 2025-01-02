return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  keys = function()
    return require("keymaps.nvim_tree")
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    sort_by = 'case_sensitive',
    update_focused_file = { enable = true, update_cwd = true, ignore_list = {} },
    view = {
      adaptive_size = true,
    },
    renderer = { group_empty = true },

    filters = { dotfiles = false },
    git = { ignore = false }

  },
}
