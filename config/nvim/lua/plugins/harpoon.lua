return {
  'ThePrimeagen/harpoon',
  keys = function()
    return require('keymaps.harpoon')
  end,
  opts = {
    global_settings = {
      save_on_toggle = false,
      save_on_change = true,
      enter_on_sendcmd = false
    }
  }
}
