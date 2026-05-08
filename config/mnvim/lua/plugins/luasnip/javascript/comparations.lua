local ls = require 'luasnip'
local i = ls.i
local s = ls.s
local fmt = require 'luasnip.extras.fmt'.fmt

return {
  s({
      trig = 'typecomp',
      name = 'Typeof',
      dscr = 'Comparation to return a boolean using typeof'
    },
    fmt([[ typeof {variable} === '{type}']], { variable = i(1, "variable"), type = i(2, "type") })),
  s({
      trig = 'instancecomp',
      name = 'Instance Of',
      dscr = 'Comparation to return a boolean using instanceof'
    },
    fmt([[ {variable} instanceof {instance}]], { variable = i(1, "variable"), instance = i(2, "Class/Interface") })),
}
