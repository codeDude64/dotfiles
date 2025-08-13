local ls = require 'luasnip'
local i = ls.i
local s = ls.s
local t = ls.t
local f = ls.function_node
local c = ls.choice_node
local r = ls.restore_node
local sn = ls.snippet_node
local rep = require 'luasnip.extras'.rep
local fmt = require 'luasnip.extras.fmt'.fmt

return {
  s({
    trig = 'print',
    name = 'Print Log',
    dscr = 'Print message or a variable on the console'
  }, fmt([[print({log});]],
    {
      log = c(1, {
        sn(1, { t('"'), r(1, "log"), t('"') }),
        sn(1, { t('f"'), r(1, "log"), t('"') }),
        sn(1, { r(1, "log") }),
      })
    }
  )),
  s({
    trig = 'logger',
    name = 'Logger Debug',
    dscr = 'Print debug log'
  }, fmt([[logger.{priority}({log});]],
    {
      priority = i(1, "info"),
      log = c(2, {
        sn(1, { t('"'), r(1, "log"), t('"') }),
        sn(1, { r(1, "log") }),
      })
    }
  )),
  s({
      trig = 'if',
      name = 'If Condition',
      dscr = 'If Condition'
    },
    fmt('if {condition}:\n    {code}\n{el}', {
      condition = i(1, "condition"),
      code = i(2, "# write your code here"),
      el = c(3, {
        t(''),
        sn(1, fmt(' elif {condition}:\n    {elseif_code}\n else:\n    {else_code}\n', {
          condition = i(1, "condition"),
          elseif_code = i(2, "# write your code here"),
          else_code = i(3, "# write your code here")
        })),
        sn(1, fmt(' elif {condition}:\n    {code}\n', {
          condition = i(1, "condition"),
          code = i(2, "# white your code here")
        })),
        sn(1, fmt(' else:\n    {code}\n', { code = i(1, "# write your code here") })),
      })
    })
  ),
  s({
      trig = 'else',
      name = 'Else Condition',
      dscr = 'Else Condition'
    },
    fmt("else:\n    {code}\n", { code = i(1, "# write your code here") })
  ),
  s({
      trig = 'elif',
      name = 'Else If Condition',
      dscr = 'Else If Condition'
    },
    fmt('elif {condition}:\n    {code}\n',
      { condition = i(1, "condition"), code = i(2, "# write your code here") })
  ),
  s({
      trig = 'ternary',
      name = 'Ternary Condition',
      dscr = 'Ternary Condition'
    },
    fmt([[{a} if {condition} else {b}]], { a = i(1, "A"), condition = i(2, "condition"), b = i(3, "B") })
  ),
  s({
      trig = 'forin',
      name = 'For In Loop',
      dscr = 'Foor in loop'
    },
    fmt('for {element} in {list}:\n    {code}\n', {
      element = i(1, "element"),
      list = i(2, "list"),
      code = i(0, "# white your code here")
    })
  ),
  s({
      trig = 'forrange',
      name = 'For Range Loop',
      dscr = 'Foor range loop'
    },
    fmt('for {element} in range({range}):\n    {code}\n', {
      element = i(1, "element"),
      range = i(2, "range"),
      code = i(0, "# white your code here")
    })
  ),
  s({
      trig = 'forcomp',
      name = 'For In list Comprehension',
      dscr = 'For In list Comprehension loop'
    },
    fmt('[{element} for {} in {list}{condition}]', {
      element = i(1, "element"),
      rep(1),
      list = i(2, "list"),
      condition = c(3, {
        sn(1, { i(1,'') }),
        sn(1, { t(' if '), i(1, "condition") })
      })
    })
  ),
  s({
      trig = 'while',
      name = 'While Loop',
      dscr = 'While loop'
    },
    fmt('while {condition}:\n    {code}\n', {
      condition = i(1, "condition"),
      code = i(0, "# white your code here")
    })
  ),
  s({
      trig = 'match',
      name = 'Match Case',
      dscr = 'Match  Case Scope'
    },
    fmt('match {key}:\n    case {value}:\n        {case_code}\n    case _:\n        {default_code}', {
      key = i(1, "key"),
      value = i(2, "value"),
      case_code = i(3, "# write your code here"),
      default_code = i(0, "# write your code here")
    })
  ),
  s({
      trig = 'fn',
      name = 'Function',
      dscr = 'Function'
    },
    fmt('def {name}({args}):\n    {code}',
      { name = i(1, "name"), args = i(2, "args"), code = i(0, "# write your code here") })
  ),
  s({
      trig = 'lambda',
      name = 'Lambda Function',
      dscr = 'Lambda Function'
    },
    fmt('lambda {args} : {code}',
      { args = i(1, "args"), code = i(0, '""" write your code here """') })
  ),
  s({
      trig = 'genexp',
      name = 'Generator Expression',
      dscr = 'Generator Expression'
    },
    fmt('({element} for {} in {list}{condition})', {
      element = i(1, "element"),
      rep(1),
      list = i(2, "list"),
      condition = c(3, {
        sn(1, { i(1,'') }),
        sn(1, { t(' if '), i(1, "condition") })
      })
    })
  ),
  s({
      trig = 'map',
      name = 'Map Function',
      dscr = 'Map Function'
    },
    fmt('map({fn}, {iterable})',
      { fn = i(1, "fn"), iterable = i(2, "iterable") })
  ),
  s({
      trig = 'filter',
      name = 'Filter Function',
      dscr = 'Filter Function'
    },
    fmt('filter({fn}, {iterable})',
      { fn = i(1, "fn"), iterable = i(2, "iterable") })
  ),
  s({
      trig = 'reduce',
      name = 'Reduce Function',
      dscr = 'Reduce Function from functools'
    },
    fmt('reduce({fn}, {iterable}, {initial_value})',
      { fn = i(1, "fn"), iterable = i(2, "iterable"), initial_value = i(3, "initial_value") })
  ),
  s({
      trig = 'dic',
      name = 'Dictionary',
      dscr = 'Dictionary'
    },
    fmt('{{\n  {dic}\n}}', { dic = i(1) })),
  s({
      trig = 'kv',
      name = 'Key/Value',
      dscr = 'Key/Value pair'
    },
    fmt([[{key}: {value},]], { key = i(1, "key"), value = i(2, "value") })
  ),
  s({
      trig = 'te',
      name = 'Try/Except',
      dscr = 'Try Except Scope'
    },
    fmt('try:\n    {code}\nexcept{error}:\n    {exception}\n',
      { code = i(1, "# write your code here"), error = i(2, " NameError"), exception = i(0, "raise") })
  ),
}
