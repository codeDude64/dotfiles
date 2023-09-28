return {
  'kylechui/nvim-surround',
  event = 'BufReadPre',
  config = function ()
    require('nvim-surround').setup()
  end
}
