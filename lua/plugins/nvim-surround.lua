return {
  'kylechui/nvim-surround',
  tag = '*',
  event = 'BufReadPre',
  config = function ()
    require('nvim-surround').setup()
  end
}
