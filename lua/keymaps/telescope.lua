local telescope = require 'telescope'
local telescope_builtin = require 'telescope.builtin'

return {
  { 'n', '<c-s>', function() telescope_builtin.grep_string { search = vim.fn.expand('<cword>') } end },
  { 'n', '<s-s>', function() telescope_builtin.grep_string({ search = vim.fn.input('Grep For > ') }) end },
  { 'n', '<c-p>', function() telescope_builtin.git_files() end },
  { 'n', '<s-p>', function() telescope_builtin.find_files({ no_ignore = true }) end },
  { 'n', 'gl', function() telescope_builtin.git_commits() end },
  { 'n', 'gb', function() telescope_builtin.git_branches() end },
  { 'n', '<leader>ts', function() telescope_builtin.treesitter() end },
  { 'n', '<leader>to', function() telescope_builtin.builtin() end },
  { 'n', '<leader><c-p>', function() telescope.extensions.repo.list {} end },
  { 'n', '<leader><c-n>', function() telescope.extensions.node_modules.list {} end }
}
