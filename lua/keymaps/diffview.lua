return {
  { '<leader>hf', function() vim.cmd("DiffviewFileHistory " .. vim.api.nvim_buf_get_name(0)) end }
}
