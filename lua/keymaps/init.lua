local keymap_setups = {
  dap = require 'keymaps.dap',
  git = require 'keymaps.git',
  harpoon = require 'keymaps.harpoon',
  lsp = require 'keymaps.lsp',
  luasnip = require 'keymaps.luasnip',
  nvim_tree = require 'keymaps.nvim_tree',
  resize = require 'keymaps.resize',
  telescope = require 'keymaps.telescope',
  silicon = require 'keymaps.silicon'
}

local M = {}

local set_keymap = function(mode, key, result, opts)
  opts = opts or { noremap = true, silent = true }
  vim.keymaps.set(mode, key, result, opts)
end

M.set = function(module)
  local module_setup = keymap_setups[module]

  for _, setup in ipairs(module_setup) do
    for _, setup_element in ipairs(setup) do
      local mode, key, result, opts = setup_element[1], setup_element[2], setup_element[3], setup_element[4]
      set_keymap(mode, key, result, opts)
    end
  end

end

return M
