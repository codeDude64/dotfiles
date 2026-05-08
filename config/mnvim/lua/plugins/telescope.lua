vim.pack.add({
  -- { src = 'https://github.com/nvim-telescope/telescope-dap.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-node-modules.nvim' },
  { src = 'https://github.com/cljoly/telescope-repo.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-fzy-native.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim' }
})

local telescope = require('telescope')
local actions = require('telescope.actions')
local sorters = require('telescope.sorters')
local builtin = require 'telescope.builtin'

telescope.setup {
  defaults = {
    file_sorter = sorters.get_fzy_sorter,
    prompt_prefix = ' >',
    color_devicons = true,
    mappings = {
      i = {
        ['<C-x>'] = false,
        ['<C-s>'] = actions.file_split,
        ['<C-q>'] = actions.send_to_qflist
      }
    }
  },
  extensions = {
    fzy_native = { override_generic_sorter = false, override_file_sorter = true },
    repo = {
      list = {
        search_dirs = {
          "~/projects",
          "~/dotfiles/"
        }
      }
    },
  }
}

telescope.load_extension('fzy_native')
telescope.load_extension('repo')
-- telescope.load_extension('dap')
telescope.load_extension('node_modules')



vim.keymap.set('n', '<c-s>', function() builtin.grep_string { search = vim.fn.expand('<cword>') } end)
vim.keymap.set('n', '<s-s>', function() builtin.grep_string({ search = vim.fn.input('Grep For > ') }) end)
vim.keymap.set('n', '<c-p>', function() builtin.git_files() end)
vim.keymap.set('n', '<s-p>', function() builtin.find_files({ no_ignore = true }) end)
vim.keymap.set('n', 'gl', function() builtin.git_commits() end)
vim.keymap.set('n', 'gb', function() builtin.git_branches() end)
vim.keymap.set('n', '<leader>ts', function() builtin.treesitter() end)
vim.keymap.set('n', '<leader>th', function() builtin.help_tags() end)
vim.keymap.set('n', '<leader>to', function() builtin.builtin() end)
vim.keymap.set('n', '<leader><c-p>', function() telescope.extensions.repo.list {} end)
vim.keymap.set('n', '<leader><c-n>', function() telescope.extensions.node_modules.list {} end)
