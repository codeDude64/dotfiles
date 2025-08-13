local ls = require 'luasnip'
local i = ls.i
local c = ls.choice_node
local r = ls.restore_node
local s = ls.s
local t = ls.t
local sn = ls.snippet_node
local rep = require 'luasnip.extras'.rep
local fmt = require 'luasnip.extras.fmt'.fmt

return {
  s({
    trig = 'cl',
    name = 'Console Log',
    dscr = 'Log a message or a variable on the console'
  }, fmt([[console.log({log});]],
    {
      log = c(1, {
        sn(1, { t('"'), r(1, "log"), t('"') }),
        sn(1, { t('"'), r(1, "log"), t('"'), t(', '), i(2, '"cool"') }),
        sn(1, { t('{ '), i(1, "/*log*/"), t(' }') })
      })
    }
  )),
  s({
    trig = 'ci',
    name = 'Console Info',
    dscr = 'Log a info message or a variable on the console'
  }, fmt([[console.info({log});]],
    {
      log = c(1, {
        sn(1, { t('"'), r(1, "log"), t('"') }),
        sn(1, { t('"'), r(1, "log"), t('"'), t(', '), i(2, '"cool"') }),
        sn(1, { t('{ '), i(1, "/*log*/"), t(' }') })
      })
    }
  )),
  s({
    trig = 'cd',
    name = 'Console Debug',
    dscr = 'Log a debug message or a variable on the console'
  }, fmt([[console.debug({log});]],
    {
      log = c(1, {
        sn(1, { t('"'), r(1, "log"), t('"') }),
        sn(1, { t('"'), r(1, "log"), t('"'), t(', '), i(2, '"cool"') }),
        sn(1, { t('{ '), i(1, "/*log*/"), t(' }') })
      })
    }
  )),
  s({
    trig = 'ce',
    name = 'Console Error',
    dscr = 'Log a error message or a variable on the console'
  }, fmt([[console.error({log});]],
    {
      log = c(1, {
        sn(1, { t('"'), r(1, "log"), t('"') }),
        sn(1, { t('"'), r(1, "log"), t('"'), t(', '), i(2, '"cool"') }),
        sn(1, { t('{ '), i(1, "/*log*/"), t(' }') })
      })
    }
  )),
  s({
    trig = 'ctr',
    name = 'Console Trace',
    dscr = 'Log the trace of a message or a variable on the console'
  }, fmt([[console.trace({log});]],
    {
      log = c(1, {
        sn(1, i(1, "/*log*/")),
        sn(1, { t('{ '), i(1, "/*log*/"), t(' }') })
      })
    }
  )),
  s({
    trig = 'ctb',
    name = 'Console Table',
    dscr = 'Log an array or an object on the console as a Table'
  }, fmt([[console.table({log});]],
    {
      log = c(1, {
        sn(1, { t('['), i(1, "elements"), t(']') }),
        sn(1, { t('{'), i(1, "elements"), t('}') })
      })
    }
  )),
  s({
      trig = 'cg',
      name = 'Console Group',
      dscr = 'Group of Log message of variables'
    },
    fmt('console.group("{groupName}");\nconsole.log("{log}");\nconsole.groupEnd();',
      { groupName = i(1, 'groupName'), log = i(0, 'log') })),
  s({
      trig = 'const',
      name = 'Constant',
      dscr = 'Declare a constant'
    },
    fmt([[const {constant};]], {
      constant = c(1, {
        sn(1, { i(1, "name"), t(' = '), i(2, "/*value*/") }),
        sn(1, i(1, "name")),
        sn(1, { t('{ '), i(1, "name"), t(' }'), t(' = '), i(2, "/*value*/") }),
      })
    })),
  s({
      trig = 'let',
      name = 'Variable',
      dscr = 'Declare a variable'
    },
    fmt([[let {variable};]], {
      variable = c(1, {
        sn(1, { i(1, "name"), t(' = '), i(2, "/*value*/") }),
        sn(1, i(1, "name")),
        sn(1, { t('{ '), i(1, "name"), t(' }'), t(' = '), i(2, "/*value*/") }),
      })
    })),
  s({
      trig = 'if',
      name = 'If Condition',
      dscr = 'If Condition'
    },
    fmt('if ({condition}) {{\n  {code}\n}}{el}', {
      condition = i(1, "condition"),
      code = i(2, "// write your code here"),
      el = c(3, {
        t(''),
        sn(1, fmt(' else if ({condition}) {{\n  {elseif_code}\n}} else {{\n  {else_code}\n}}', {
          condition = i(1, "condition"),
          elseif_code = i(2, "// write your code here"),
          else_code = i(3, "// write your code here")
        })),
        sn(1, fmt(' else if ({condition}) {{\n  {code}\n}}', {
          condition = i(1, "condition"),
          code = i(2, "// white your code here")
        })),
        sn(1, fmt(' else {{\n  {code}\n}}', { code = i(1, "// write your code here") })),
      })
    })
  ),
  s({
      trig = 'else',
      name = 'Else Condition',
      dscr = 'Else Condition'
    },
    fmt("else {{\n  {code}\n}}", { code = i(1, "// write your code here") })
  ),
  s({
      trig = 'elif',
      name = 'Else If Condition',
      dscr = 'Else If Condition'
    },
    fmt('else if ({condition}) {{\n  {code}\n}}',
      { condition = i(1, "condition"), code = i(2, "// write your code here") })
  ),
  s({
      trig = 'ternary',
      name = 'Ternary Condition',
      dscr = 'Ternary Condition'
    },
    fmt([[{condition} ? {a} : {b};]], { condition = i(1, "condition"), a = i(2, "A"), b = i(3, "B") })),
  s({
      trig = 'for',
      name = 'For Loop',
      dscr = 'Usual for loop'
    },
    fmt('for ({type} {variable} = 0; {} < {length}; {}++)  {{\n  {code}\n}}', {
      type = i(1, "const"),
      variable = i(2, "i"),
      rep(2),
      length = i(3, "arr.length"),
      rep(2),
      code = i(0, "// write your code here")
    })
  ),
  s({
      trig = 'forin',
      name = 'For In Loop',
      dscr = 'Foor in loop'
    },
    fmt('for ({type} {element} in {array}) {{\n  {code}\n}}', {
      type = i(1, "const"),
      element = i(2, "element"),
      array = i(3, "array"),
      code = i(0, "// white your code here")
    })
  ),
  s({
      trig = 'forof',
      name = 'For Of Loop',
      dscr = 'Foor of loop'
    },
    fmt('for ({type} {element} of {array}) {{\n  {code}\n}}', {
      type = i(1, "const"),
      element = i(2, "element"),
      array = i(3, "array"),
      code = i(0, "// white your code here")
    })
  ),
  s({
      trig = 'while',
      name = 'While Loop',
      dscr = 'Usual while loop'
    },
    fmt('while ({condition}) {{\n  {code}\n}}', { condition = i(1, "condition"), code = i(0, "// white your code here") })
  ),
  s({
      trig = 'tc',
      name = 'Try/Catch',
      dscr = 'Try Catch Scope'
    },
    fmt('try {{\n  {code}\n}} catch({error}) {{\n {exception} \n}}',
      { code = i(1, "// write your code here"), error = i(2, "error"), exception = i(0, " console.error(error);") })
  ),
  s({
      trig = 'switch',
      name = 'Switch Case',
      dscr = 'Switch Case Scope'
    },
    fmt('switch ({key}) {{\n  case {value}:\n    {case_code}\n  break;\n  default:\n\n  break;\n}}', {
      key = i(1, "key"),
      value = i(2, "value"),
      case_code = i(0, "// write your code here")
    })
  ),
  s({
      trig = 'fn',
      name = 'Anonymous or Named Function',
      dscr = 'Anonymous or named common Function'
    },
    fmt('function {name}({args}) {{\n  {code}\n}}',
      { name = i(1, "name"), args = i(2, "args"), code = i(0, "// write your code here") })),
  s({
      trig = 'af',
      name = 'Arrow Function',
      dscr = 'Arrow Function'
    },
    fmt('({args}) => {body}', {
      args = i(1, "args"),
      body = c(2, {
        sn(1, fmt('{{\n  {code}\n}}', { code = i(1, "// write your code here") })),
        sn(1, fmt('{code}', { code = i(1, "/*write your code here*/") }))
      })
    })),
  s({
      trig = '.forEach',
      name = 'Foor Each Loop',
      dscr = 'Foor Each Loop'
    },
    fmt('.forEach({callback});', { callback = i(1, "/*callback*/") })),
  s({
      trig = '.map',
      name = 'Map Loop',
      dscr = 'Map Loop'
    },
    fmt('.map({callback})', { callback = i(1, "/*callback*/") })),
  s({
      trig = '.filter',
      name = 'Filter Loop',
      dscr = 'Filter Loop'
    },
    fmt('.filter({callback})', { callback = i(1, "/*callback*/") })),
  s({
      trig = '.find',
      name = 'Find Loop',
      dscr = 'Find Loop'
    },
    fmt('.find({callback})', { callback = i(1, "/*callback*/") })),
  s({
      trig = '.reduce',
      name = 'Reduce Loop',
      dscr = 'Reduce Loop'
    },
    fmt('.reduce({callback}, {initialValue})',
      { callback = i(1, "/*callback*/"), initialValue = i(2, "initialValue") })),
  s({
      trig = 'obj',
      name = 'Object Literal',
      dscr = 'Object Literal'
    },
    fmt('{{\n  {obj}\n}}', { obj = i(1) })),
  s({
      trig = 'kv',
      name = 'Key/Value',
      dscr = 'Key/Value pair'
    },
    fmt([[{key}: {value},]], { key = i(1, "key"), value = i(2, "value") })),
  s({
      trig = '.then',
      name = 'Then',
      dscr = 'Then Promise'
    },
    fmt('.then({callback})', { callback = i(1, "/*callback*/") })),
  s({
      trig = '.catch',
      name = 'Catch',
      dscr = 'Catch Promise'
    },
    fmt('.catch({callback})', { callback = i(1, "/*callback*/") })),
  s({
      trig = '.finally',
      name = 'Finally',
      dscr = 'Finally Promise'
    },
    fmt('.finally({callback})', { callback = i(1, "/*callback*/") })),
  s({
      trig = 'newpromise',
      name = 'Promise',
      dscr = 'Promise ES6'
    },
    fmt('new Promise((resolve, reject) => {{\n  {}\n}})', i(0, "// wirte your code here"))),
  s({
      trig = 'st',
      name = 'Set Timeout',
      dscr = 'Set Timeout'
    },
    fmt('setTimeout({callback});', { callback = i(1, "/*callback*/") })),
  s({
      trig = 'si',
      name = 'Set Interval',
      dscr = 'Set Interval'
    },
    fmt('setInterval({callback});', { callback = i(1, "/*callback*/") })),
  s({
      trig = 'us',
      name = 'Use Strict',
      dscr = 'Use Strict'
    },
    t("'use strict'")),
  s({
      trig = 'return',
      name = 'Return',
      dscr = 'Return'
    },
    fmt([[return {}]], i(0, "value"))),
}
