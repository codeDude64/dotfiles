local neogit = require('neogit')
local diffview = require('diffview')

diffview.setup()

neogit.setup { integrations = { diffview = true } }
