local resize = require('keymaps.resize')


for _, setup in ipairs(resize) do
  local mode, key, result, opts = setup[1], setup[2], setup[3], setup[4]
  opts = opts or { noremap = true, silent = true }

  vim.keymap.set(mode, key, result, opts)
end
