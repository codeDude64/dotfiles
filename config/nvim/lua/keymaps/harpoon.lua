local harpoon_mark = require 'harpoon.mark'
local harpoon_ui = require 'harpoon.ui'
local harpoon_term = require 'harpoon.term'

return {
  { '<leader>hM', function() harpoon_mark.add_file() end },
  { '<leader>hi', function() harpoon_ui.nav_next() end },
  { '<leader>ho', function() harpoon_ui.nav_prev() end },
  { '<leader>hm', function() harpoon_ui.toggle_quick_menu() end },
  { '<leader>ht', function() harpoon_term.gotoTerminal(1) end },
  { '<leader>hT', function() harpoon_term.gotoTerminal(2) end }
}
