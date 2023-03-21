
local map = function(mode, key, result, opts)
  opts = opts or { noremap = true, silent = true }
  print(mode, key, result, opts)
  vim.keymap.set(mode, key, result, opts)
end


local setVimMaps = function ()
  local resize = require('keymaps.resize')

  for _, setup in ipairs(resize) do
      local mode, key, result, opts = 'n', setup[1], setup[2], setup[3]
      map(mode, key, result, opts)
  end
end

setVimMaps()
