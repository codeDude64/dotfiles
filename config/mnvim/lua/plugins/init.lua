M = {}
M.setup = function ()
  require("plugins.dependencies")
  require("plugins.nvim-treesitter")
  require("plugins.gruvbox")
  require("plugins.nvim-autopairs")
  require("plugins.nvim-cmp")
  require("plugins.nvim-lspconfig")
  require("plugins.nvim-tree")
  require("plugins.bufferline")
  require("plugins.diffview")
  require("plugins.gitsigns")
  require("plugins.harpoon")
  require("plugins.image")
  require("plugins.neogit")
  require("plugins.nvim-surround")
  require("plugins.render-markdown")
  require("plugins.telescope")
  require("plugins.vimtex")
  require("plugins.lualine")
end

return M
