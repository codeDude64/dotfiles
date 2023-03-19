local neogit = require 'neogit'

return {
  { '<leader>gs', function() neogit.open() end },
  { '<leader>hf', function() vim.cmd("DiffviewFileHistory " .. vim.api.nvim_buf_get_name(0)) end }
}
