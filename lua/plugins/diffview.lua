return {
  'sindrets/diffview.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  keys = function()
    return require('keymaps.diffview')
  end,
}
