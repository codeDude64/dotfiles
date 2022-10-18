local harpoon = require 'harpoon'

local harpoon_config = {
  global_settings = {
    save_on_toggle = false,
    save_on_change = true,
    enter_on_sendcmd = false
  },
  projects = { ['$HOME/Projects/jibjab-api'] = { term = { cmds = { 'make up' } } } }
}

harpoon.setup(harpoon_config)
