local load_core = function ()
  vim.g.mapleader = ' '
  require("core.options.global")
  require("core.options.buffer")
  require("core.options.window")
  require("core.globals")
  require("core.keymaper")
  require("core.lazy")
end

load_core()

--require 'codeDude'
