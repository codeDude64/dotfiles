return {
  'NeogitOrg/neogit',
  dependencies = 'nvim-lua/plenary.nvim',
  keys = function()
    return require('keymaps.neogit')
  end,
  opts = {
    integrations = {
      diffview = true,
      telescope = true
    }
  }
}
