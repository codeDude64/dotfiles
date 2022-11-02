local neogit = require 'neogit'

return {
  { 'n', '<leader>gs', function() neogit.open() end },
  { 'n', '<leader>hf', function() vim.cmd("DiffviewFileHistory " .. vim.api.nvim_buf_get_name(0)) end }
}
