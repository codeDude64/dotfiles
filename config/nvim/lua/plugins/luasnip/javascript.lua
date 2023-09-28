local react_snippets = require 'plugins.luasnip.react'
local ls = require 'luasnip'
local i = ls.i
local c = ls.choice_node
local s = ls.s
local t = ls.t
local sn = ls.snippet_node
local rep = require 'luasnip.extras'.rep
local fmt = require 'luasnip.extras.fmt'.fmt

local javascript_snippets = {
  s({
    trig = 'cl',
    name = 'Console Log',
    dscr = 'Log a message or a variable on the console'
  }, fmt([[console.log({});]],
    c(1, {
      sn(1, { t('"'), i(1), t('"') }),
      sn(1, { t('"'), i(1), t('"'), t(', '), i(2) }),
      sn(1, { t('{ '), i(1), t(' }') })
    })
  )),
  s({
    trig = 'ci',
    name = 'Console Info',
    dscr = 'Log a info message or a variable on the console'
  }, fmt([[console.info({});]],
    c(1, {
      sn(1, { t('"'), i(1), t('"') }),
      sn(1, { t('"'), i(1), t('"'), t(', '), i(2) }),
      sn(1, { t('{ '), i(1), t(' }') })
    })
  )),
  s({
    trig = 'cd',
    name = 'Console Debug',
    dscr = 'Log a debug message or a variable on the console'
  }, fmt([[console.debug({});]],
    c(1, {
      sn(1, { t('"'), i(1), t('"') }),
      sn(1, { t('"'), i(1), t('"'), t(', '), i(2) }),
      sn(1, { t('{ '), i(1), t(' }') })
    })
  )),
  s({
    trig = 'ce',
    name = 'Console Error',
    dscr = 'Log a error message or a variable on the console'
  }, fmt([[console.error({});]],
    c(1, {
      sn(1, { t('"'), i(1), t('"') }),
      sn(1, { t('"'), i(1), t('"'), t(', '), i(2) }),
      sn(1, { t('{ '), i(1), t(' }') })
    })
  )),
  s({
    trig = 'ctr',
    name = 'Console Trace',
    dscr = 'Log the trace of a message or a variable on the console'
  }, fmt([[console.trace({});]],
    c(1, {
      sn(1, i(1)),
      sn(1, { t('{ '), i(1), t(' }') })
    })
  )),
  s({
    trig = 'ctb',
    name = 'Console Table',
    dscr = 'Log an array or an object on the console as a Table'
  }, fmt([[console.table({});]],
    c(1, {
      sn(1, { t('['), i(1), t(']') }),
      sn(1, { t('{'), i(1), t('}') })
    })
  )),
  s({
    trig = 'cg',
    name = 'Console Group',
    dscr = 'Group of Log message of variables'
  },
    fmt('console.group("{}");\nconsole.log("{}");\nconsole.groupEnd();', { i(1, 'groupName'), i(2, 'message') })),
  s({
    trig = 'imp',
    name = 'Import Named Module',
    dscr = 'Import a named emacscript module'
  },
    fmt([[import {{ {} }} from '{}';]], { i(1), i(2) })),
  s({
    trig = 'impd',
    name = 'Import Default Module',
    dscr = 'Import a default emacscript module'
  },
    fmt([[import {} from '{}';]], { i(1), i(2) })),
  s({
    trig = 'exp',
    name = 'Export Named Module',
    dscr = 'Export a named emacscript module'
  },
    fmt([[export {};]], i(1))),
  s({
    trig = 'expd',
    name = 'Export Default Module',
    dscr = 'Export a default emacscript module'
  },
    fmt([[export default {};]], i(1))),
  s({
    trig = 're',
    name = 'Require',
    dscr = 'Require NodeJS'
  },
    fmt([[require({})]], i(1))),
  s({
    trig = 'req',
    name = 'Require Assignment',
    dscr = 'Require Assignment NodeJS'
  },
    fmt([[const {} = require('{}')]], { i(1), rep(1) })),
  s({
    trig = 'dreq',
    name = 'Destructuring Require Assignment',
    dscr = 'Require Assignment with destructuring NodeJS'
  },
    fmt([[const {{ {} }} = require('{}')]], { i(1), rep(1) })),
  s({
    trig = 'em',
    name = 'Export Memeber',
    dscr = 'Export Memeber NodeJS'
  },
    fmt([[exports.{} = {}]], { i(1), i(2) })),
  s({
    trig = 'me',
    name = 'Module Export',
    dscr = 'Module Export NodeJS'
  },
    fmt([[module.exports = {}]], i(1))),
  s({
    trig = 'co',
    name = 'Constant',
    dscr = 'Declare a constant'
  },
    fmt([[const {};]], {
      c(1, {
        sn(1, { i(1), t(' = '), i(2) }),
        sn(1, i(1)),
        sn(1, { t('{ '), i(1), t(' }'), t(' = '), i(2) }),
      })
    })),
  s({
    trig = 'l',
    name = 'Variable',
    dscr = 'Declare a variable'
  },
    fmt([[let {};]], {
      c(1, {
        sn(1, { i(1), t(' = '), i(2) }),
        sn(1, i(1)),
        sn(1, { t('{ '), i(1), t(' }'), t(' = '), i(2) }),
      })
    })),
  s({
    trig = 'if',
    name = 'If Condition',
    dscr = 'If Condition'
  },
    fmt('if ({}) {{\n  {}\n}}{}', {
      i(1),
      i(2),
      c(3, {
        t(''),
        sn(1, fmt(' else if ({}) {{\n  {}\n}} else {{\n  {}\n}}', { i(1), i(2), i(3) })),
        sn(1, fmt(' else if ({}) {{\n  {}\n}}', { i(1), i(2) })),
        sn(1, fmt(' else {{\n  {}\n}}', i(1))),
      })
    })),
  s({
    trig = 'el',
    name = 'Else Condition',
    dscr = 'Else Condition'
  },
    fmt("else {{\n  {}\n}}", i(1))),
  s({
    trig = 'ei',
    name = 'Else If Condition',
    dscr = 'Else If Condition'
  },
    fmt('else if ({}) {{\n  {}\n}}', { i(1), i(2) })),
  s({
    trig = 'ter',
    name = 'Ternary Condition',
    dscr = 'Ternary Condition'
  },
    fmt([[{} ? {} : {}]], { i(1), i(2), i(3) })),
  s({
    trig = 'fl',
    name = 'For Loop',
    dscr = 'Usual for loop'
  },
    fmt('for (let {} = 0, {} < {}.length; {}++)  {{\n  {}\n}}', {
      i(1),
      rep(1),
      i(2),
      rep(1),
      i(0)
    })),
  s({
    trig = 'fi',
    name = 'For In Loop',
    dscr = 'Foor in loop'
  },
    fmt('for (let {} in {}) {{\n  {}\n}}', {
      i(1),
      i(2),
      i(0)
    })),
  s({
    trig = 'fo',
    name = 'For Of Loop',
    dscr = 'Foor of loop'
  },
    fmt('for (let {} of {}) {{\n  {}\n}}', {
      i(1),
      i(2),
      i(0)
    })),
  s({
    trig = 'wl',
    name = 'While Loop',
    dscr = 'While Loop'
  },
    fmt('while ({}) {{\n  {}\n}}', { i(1), i(0) })),
  s({
    trig = 'tc',
    name = 'Try/Catch',
    dscr = 'Try Catch Scope'
  },
    fmt('try {{\n  {}\n}}{}', {
      i(1),
      c(2, {
        sn(1, fmt(' catch ({}) {{\n  {}\n}}', { i(1), i(2) })),
        sn(1, fmt(' finally {{\n  {}\n}} catch ({}) {{\n  {}\n}}', { i(1), i(2), i(3) })),
        sn(1, fmt(' finally {{\n  {}\n}}', i(1))),
      })
    })),
  s({
    trig = 'sw',
    name = 'Switch Case',
    dscr = 'Switch Case Scope'
  },
    fmt('switch ({}) {{\n  case {}:\n  return; {}\ndefault:\n  return;\n}}', {
      i(1),
      i(2),
      i(0)
    })),
  s({
    trig = 'fn',
    name = 'Anonymous or Named Function',
    dscr = 'Anonymous or named common Function'
  },
    fmt('function {}({}) {{\n  {}\n}}', { i(1), i(2), i(0) })),
  s({
    trig = 'af',
    name = 'Arrow Function',
    dscr = 'Arrow Function'
  },
    fmt('({}) => {}', {
      i(1),
      c(2, {
        sn(1, fmt('{{\n  {}\n}}', i(1))),
        sn(1, fmt('{}', i(1)))
      })
    })),
  s({
    trig = 'fe',
    name = 'Foor Each Loop',
    dscr = 'Foor Each Loop'
  },
    fmt('{}.forEach(({}) => {{\n  {}\n}});', { i(1), i(2), i(0) })),
  s({
    trig = 'map',
    name = 'Map Loop',
    dscr = 'Map Loop'
  },
    fmt('{}.map(({}) => {{\n  {}\n}});', { i(1), i(2), i(0) })),
  s({
    trig = 'filter',
    name = 'Filter Loop',
    dscr = 'Filter Loop'
  },
    fmt('{}.filter(({}) => {{\n  {}\n}});', { i(1), i(2), i(0) })),
  s({
    trig = 'find',
    name = 'Find Loop',
    dscr = 'Find Loop'
  },
    fmt('{}.find(({}) => {{\n  {}\n}});', { i(1), i(2), i(0) })),
  s({
    trig = 'reduce',
    name = 'Reduce Loop',
    dscr = 'Reduce Loop'
  },
    fmt('{}.reduce(({}) => {{\n  {}\n}}, [{}]);', { i(1), i(2), i(3), i(4) })),
  s({
    trig = 'ol',
    name = 'Object Literal',
    dscr = 'Object Literal'
  },
    fmt('{{\n  {}\n}}', i(1))),
  s({
    trig = 'kv',
    name = 'Key/Value',
    dscr = 'Key/Value pair'
  },
    fmt([[{}: {}]], { i(1), i(2) })),
  s({
    trig = 'c',
    name = 'Class',
    dscr = 'Class ES6'
  },
    fmt('class {} {{\n  constructor({}) {{\n    {}\n  }}\n}}', { i(1), i(2), i(0) })),
  s({
    trig = 'ctor',
    name = 'Constructor',
    dscr = 'Class Constructor ES6'
  },
    fmt('constructor({}) {{\n  super({});\n  {}\n}}', { i(1), rep(1), i(0) })),
  s({
    trig = 'm',
    name = 'Method',
    dscr = 'Method ES6'
  },
    fmt('{}({}) {{\n  {}\n}}', { i(1), i(2), i(0) })),
  s({
    trig = 'get',
    name = 'Get',
    dscr = 'Getter ES6'
  },
    fmt('get {}({}) {{\n  {}\n}}', { i(1), i(2), i(0) })),
  s({
    trig = 'set',
    name = 'Set',
    dscr = 'Setter ES6'
  },
    fmt('set {}({}) {{\n  {}\n}}', { i(1), i(2), i(0) })),
  s({
    trig = 'gs',
    name = 'Getter and Setter',
    dscr = 'Getter and Setter ES6'
  },
    fmt('get {}() {{\n  {}\n}}\nset {}({}) {{\n  \n}}', {
      i(1),
      i(0),
      rep(1),
      i(2)
    })),
  s({
    trig = 'r',
    name = 'Return',
    dscr = 'Return'
  },
    fmt([[return {}]], i(0))),
  s({
    trig = 'rc',
    name = 'Return Complex',
    dscr = 'Return complex values like JSX'
  },
    fmt('return (\n  {}\n)', i(0))),
  s({
    trig = 'tof',
    name = 'Typeof',
    dscr = 'Comparation to return a boolean using typeof'
  },
    fmt([[ typeof {} === '{}']], { i(1), i(2) })),
  s({
    trig = 'iof',
    name = 'Instance Of',
    dscr = 'Comparation to return a boolean using instanceof'
  },
    fmt([[ {} instanceof '{}']], { i(1), i(2) })),
  s({
    trig = 'pr',
    name = 'Promise',
    dscr = 'Promise ES6'
  },
    fmt('new Promise((resolve, reject) => {{\n  {}\n}});', i(0))),
  s({
    trig = 'then',
    name = 'Then',
    dscr = 'Then Promise'
  },
    fmt('{}.then(({}) => {{\n  {}\n}})', { i(1), i(2), i(0) })),
  s({
    trig = 'catch',
    name = 'Catch',
    dscr = 'Catch Promise'
  },
    fmt('{}.catch(({}) => {{\n  {}\n}})', { i(1), i(2), i(0) })),
  s({
    trig = 'desc',
    name = 'Describe',
    dscr = 'Describe Jest'
  },
    fmt("describe('{}', () => {{\n  {}\n}});", { i(1), i(0) })),
  s({
    trig = 'cont',
    name = 'Context',
    dscr = 'Context Jest'
  },
    fmt("context('{}', () => {{\n  {}\n}});", { i(1), i(0) })),
  s({
    trig = 'it',
    name = 'It Should',
    dscr = 'It Should Jest'
  },
    fmt("it('should {}', () => {{\n  {}\n}});", { i(1), i(0) })),
  s({
    trig = 'bf',
    name = 'Before',
    dscr = 'Before Jest'
  },
    fmt('before(() => {{\n  {}\n}});', i(1))),
  s({
    trig = 'bfe',
    name = 'Before Each',
    dscr = 'Before Each Jest'
  },
    fmt('beforeEach(() => {{\n  {}\n}});', i(1))),
  s({
    trig = 'aft',
    name = 'After',
    dscr = 'After Jest'
  },
    fmt('after(() => {{\n  {}\n}});', i(1))),
  s({
    trig = 'afte',
    name = 'After Each',
    dscr = 'Afte Eachr Jest'
  },
    fmt('afterEach(() => {{\n  {}\n}});', i(1))),
  s({
    trig = 'st',
    name = 'Set Timeout',
    dscr = 'Set Timeout'
  },
    fmt('setTimeout(() => {{\n  {}\n}}, {});', { i(0), i(1) })),
  s({
    trig = 'si',
    name = 'Set Interval',
    dscr = 'Set Interval'
  },
    fmt('setInterval(() => {{\n  {}\n}}, {});', { i(0), i(1) })),
  s({
    trig = 'us',
    name = 'Use Strict',
    dscr = 'Use Strict'
  },
    t("'use strict'"))
}

for _, react_snippet in ipairs(react_snippets) do
  table.insert(javascript_snippets, react_snippet)
end

return javascript_snippets
