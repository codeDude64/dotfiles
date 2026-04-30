local ls = require 'luasnip'
local i = ls.i
local s = ls.s
local rep = require 'luasnip.extras'.rep
local fmt = require 'luasnip.extras.fmt'.fmt

return {
  s({
      trig = 'imp',
      name = 'Import Named Module',
      dscr = 'Import a named emacscript module'
    },
    fmt([[import {{ {module} }} from '{file}';]], { module = i(1, "Module"), file = i(2, 'file') })),
  s({
      trig = 'impd',
      name = 'Import Default Module',
      dscr = 'Import a default emacscript module'
    },
    fmt([[import {module} from '{file}';]], { module = i(1, "Module"), file = i(2, 'file') })),
  s({
      trig = 'exp',
      name = 'Export Named Module',
      dscr = 'Export a named emacscript module'
    },
    fmt([[export {module};]], { module = i(1, "Module") })),
  s({
      trig = 'expd',
      name = 'Export Default Module',
      dscr = 'Export a default emacscript module'
    },
    fmt([[export default {module};]], { module = i(1, "Module") })),
  s({
      trig = 'class',
      name = 'Class',
      dscr = 'Class ES6'
    },
    fmt('class {name} {{\n  constructor({args}) {{\n    {code}\n  }}\n}}',
      { name = i(1, "Name"), args = i(2, "args"), code = i(0, "// write your code here") })),
  s({
      trig = 'constructor',
      name = 'Constructor',
      dscr = 'Class Constructor ES6'
    },
    fmt('constructor({args}) {{\n  super({});\n  {code}\n}}',
      { args = i(1, "args"), rep(1), code = i(0, "// write your code") })),
  s({
      trig = 'method',
      name = 'Method',
      dscr = 'Method ES6'
    },
    fmt('{name}({args}) {{\n  {code}\n}}',
      { name = i(1, "name"), args = i(2, "args"), code = i(0, "// write your code here") })),
  s({
      trig = 'get',
      name = 'Get',
      dscr = 'Getter ES6'
    },
    fmt('get {name}() {{\n  return this.{attr};\n}}', { name = i(1, "name"), attr = i(0, "attr") })),
  s({
      trig = 'set',
      name = 'Set',
      dscr = 'Setter ES6'
    },
    fmt('set {name}({attr}) {{\n  this.{} = {};\n}}', { name = i(1, "name"), attr = i(2, "attr"), rep(2), rep(2) })),
  s({
      trig = 'accessors',
      name = 'Accessors',
      dscr = 'Object accessors ES6'
    },
    fmt('get {name}() {{\n  return this.{attr} \n}};\nset {}({}) {{\n  this.{} = {};\n}}',
      { name = i(1, "name"), attr = i(2, "attr"), rep(1), rep(2), rep(2), rep(2) })),
}
