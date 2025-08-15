local ls = require 'luasnip'
local i = ls.i
local s = ls.s
local fmt = require 'luasnip.extras.fmt'.fmt

return {
  s({
      trig = 'require',
      name = 'Require',
      dscr = 'Require NodeJS'
    },
    fmt([[require({module})]], { module = i(1, "module") })),
  s({
      trig = 'em',
      name = 'Export Memeber',
      dscr = 'Export Memeber NodeJS'
    },
    fmt([[exports.{module} = {variable}]], { module = i(1, "defaults"), variable = i(2, "variable") })),
  s({
      trig = 'me',
      name = 'Module Export',
      dscr = 'Module Export NodeJS'
    },
    fmt([[module.exports = {module}]], { module = i(1) })),
}
