return {
  'krivahtoo/silicon.nvim',
  build = './install.sh build',
  keys = function ()
    return require('keymaps.silicon')
  end,
  opts = {
    font = 'VictorMono Nerd Font=16',
    theme = 'Dracula',
  }
}
