local dap = require 'dap'
local osv = require 'osv'

return {
  { '<F5>',       function() dap.continue() end },
  { '<F10>',      function() dap.step_over() end },
  { '<F11>',      function() dap.step_into() end },
  { '<F12>',      function() dap.step_out() end },
  { '<leader>b',  function() dap.toggle_breakpoint() end },
  { '<leader>B',  function() dap.set_breakpoint(vim.fn.input('Breakpoint condition:')) end },
  { '<leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message:')) end },
  { '<leader>dr', function() dap.repl.open() end },
  { '<leader>dl', function() dap.run_last() end },
  { '<leader>ld', function() osv.run_this() end },
}
