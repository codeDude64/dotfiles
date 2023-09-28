local telescope = require 'telescope'
local telescope_builtin = require 'telescope.builtin'

return {
  { '<c-s>',         function() telescope_builtin.grep_string { search = vim.fn.expand('<cword>') } end },
  { '<s-s>',         function() telescope_builtin.grep_string({ search = vim.fn.input('Grep For > ') }) end },
  { '<c-p>',         function() telescope_builtin.git_files() end },
  { '<s-p>',         function() telescope_builtin.find_files({ no_ignore = true }) end },
  { 'gl',            function() telescope_builtin.git_commits() end },
  { 'gb',            function() telescope_builtin.git_branches() end },
  { '<leader>ts',    function() telescope_builtin.treesitter() end },
  { '<leader>to',    function() telescope_builtin.builtin() end },
  { '<leader><c-p>', function() telescope.extensions.repo.list {} end },
  { '<leader><c-n>', function() telescope.extensions.node_modules.list {} end }
}
