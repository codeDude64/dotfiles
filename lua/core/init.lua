local load_core = function ()
  vim.g.mapleader = ' '
  require("core.options.global")
  require("core.options.buffer")
  require("core.options.window")
end

load_core()

require 'codeDude'
