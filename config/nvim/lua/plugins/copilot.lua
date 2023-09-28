return {
  'zbirenbaum/copilot.lua',
  cmd = 'Copilot',
  event = 'InsertEnter',
  config = function()
    local copilot = require 'copilot'

    copilot.setup {
      suggestions = { enable = false },
      panel = { enable = false }
    }
  end
}
