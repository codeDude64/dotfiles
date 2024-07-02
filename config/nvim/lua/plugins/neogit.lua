return {
  'NeogitOrg/neogit',
  dependencies = 'nvim-lua/plenary.nvim',
  keys = function()
    return require('keymaps.neogit')
  end,
  config = function()
    local neogit = require('neogit')
    neogit.setup { integrations = { diffview = true, telescope = true } }
  end
}
