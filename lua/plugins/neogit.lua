return {
  'TimUntersberger/neogit',
  keys = function()
    return require('keymaps.neogit')
  end,
  config = function()
    local neogit = require('neogit')
    neogit.setup { integrations = { diffview = true } }
  end
}
