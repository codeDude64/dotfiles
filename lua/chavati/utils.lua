local M = {}

M.key_mapper = function(mode, key, result, config)
  config = config or {noremap = true, silent = true}
  vim.api.nvim_set_keymap(mode, key, result, config)
end

return M
