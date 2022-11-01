local dap = require 'dap'

return {
  { 'n', '<F5>', function() dap.continue() end },
  { 'n', '<F10>', function() dap.step_over() end },
  { 'n', '<F11>', function() dap.step_into() end },
  { 'n', '<F12>', function() dap.step_out() end },
  { 'n', '<leader>b', function() dap.toggle_breakpoint() end },
  { 'n', '<leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition:')) end },
  { 'n', '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message:')) end },
  { 'n', '<leader>dr', function() dap.repl.open() end },
  { 'n', '<leader>dl', function() dap.run_last() end },

}
