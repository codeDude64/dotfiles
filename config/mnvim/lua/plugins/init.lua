M = {}
M.setup = function ()
  require("plugins.dependencies")
  require("plugins.nvim-treesitter")
  require("plugins.gruvbox")
  require("plugins.nvim-cmp")
  require("plugins.nvim-lspconfig")
  require("plugins.nvim-tree")
end

return M
