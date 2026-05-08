local ls = require 'luasnip'
local i = ls.i
local s = ls.s
local fmt = require 'luasnip.extras.fmt'.fmt

return {
  s({
      trig = 'describe',
      name = 'Describe',
      dscr = 'Describe Jest'
    },
    fmt("describe('{description}', () => {{\n  {code}\n}});",
      { description = i(1), code = i(0, "// write your code here") })),
  s({
      trig = 'cont',
      name = 'Context',
      dscr = 'Context Jest'
    },
    fmt("context('{description}', () => {{\n  {code}\n}});",
      { description = i(1), code = i(0, "// write your code here") })),
  s({
      trig = 'it',
      name = 'It Should',
      dscr = 'It Should Jest'
    },
    fmt("it('should {description}', () => {{\n  {code}\n}});",
      { description = i(1), code = i(0, "// write your code here") })),
  s({
      trig = 'bf',
      name = 'Before',
      dscr = 'Before Jest'
    },
    fmt('before(() => {{\n  {}\n}});', i(1, "// write your code here"))),
  s({
      trig = 'bfe',
      name = 'Before Each',
      dscr = 'Before Each Jest'
    },
    fmt('beforeEach(() => {{\n  {}\n}});', i(1, "// write your code here"))),
  s({
      trig = 'aft',
      name = 'After',
      dscr = 'After Jest'
    },
    fmt('after(() => {{\n  {}\n}});', i(1, "// write your code here"))),
  s({
      trig = 'afte',
      name = 'After Each',
      dscr = 'Afte Eachr Jest'
    },
    fmt('afterEach(() => {{\n  {}\n}});', i(1, "// write your code here"))),
}
