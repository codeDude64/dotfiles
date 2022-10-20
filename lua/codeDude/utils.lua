local M = {}

M.key_mapper = function(mode, key, result, opts)
  opts = opts or { noremap = true, silent = true }
  vim.keymap.set(mode, key, result, opts)
end

return M
