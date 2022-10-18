local M = {}

M.key_mapper = function(mode, key, result, opts)
  opts = opts or { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, key, result, opts)
end

return M
