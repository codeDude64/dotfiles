local maps_config = {
 dap = require 'codeDude.mappings.dap',
 git = require 'codeDude.mappings.git',
 harpoon = require 'codeDude.mappings.harpoon',
 lsp = require 'codeDude.mappings.lsp',
 luasnip = require 'codeDude.mappings.luasnip',
 nvim_tree = require 'codeDude.mappings.nvim_tree',
 resize = require 'codeDude.mappings.resize',
 telescope = require 'codeDude.mappings.telescope',
 silicon = require 'codeDude.mappings.silicon'
}

local M = {}

for _, map in pairs(maps_config) do
  for _, m in ipairs(map) do
    table.insert(M, m)
  end
end

return M
