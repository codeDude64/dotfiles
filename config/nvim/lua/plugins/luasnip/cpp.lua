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
      trig = '#inc',
      name = 'Include',
      dscr = 'include a library'
    },
    fmt([[#include {library}]],
      {
        library = c(1, {
          sn(1, { t('"'), r(1, "library"), t('"') }),
          sn(1, { t('<'), r(1, "library"), t('>') })
        })
      }
    )
  ),
  s({
      trig = 'cout',
      name = 'Cout',
      dscr = 'output of standar library'
    },
    fmt([[std::cout << {output} << '\n';]],
      {
        output = c(1, {
          sn(1, { r(1, "") }),
          sn(1, { t('"'), r(1, ""), t('"') })
        })
      }
    )
  ),
  s({
      trig = 'cin',
      name = 'Cin',
      dscr = 'input of standar library'
    },
    fmt("std::cin >> {input};", {
      input = i(1, "/*input*/")
    })
  ),
  s({
      trig = 'main',
      name = 'Main',
      dscr = 'Main function'
    },
    fmt('int main(int argc, char* argv[]) {{\n {code}\n return 0;\n}}', { code = i(0, "// white your code here") })
  ),
  s({
      trig = 'for',
      name = 'For Loop',
      dscr = 'Usual for loop'
    },
    fmt('for ({type} {variable} = 0; {} < {length}; {}++)  {{\n  {code}\n}}', {
      type = i(1, "int"),
      variable = i(2, "i"),
      rep(2),
      length = i(3, "arr.length"),
      rep(2),
      code = i(0, "// write your code here")
    })
  ),
  s({
      trig = 'forrange',
      name = 'Range-Based For loop',
      dscr = 'Range-Based For loop Similar to ForEach'
    },
    fmt('for ({type} {element} : {range}) {{\n  {code}\n}}', {
      type = i(1, "int"),
      element = i(2, "element"),
      range = i(3, "range"),
      code = i(0, "// white your code here")
    })
  ),
  s({
      trig = 'do',
      name = 'Do While Loop',
      dscr = 'Usual do while loop'
    },
    fmt('do {{\n  {code}\n}} while({condition});',
      { code = i(0, "// write your code here"), condition = i(1, "condition") })
  ),
  s({
      trig = 'while',
      name = 'While Loop',
      dscr = 'Usual while loop'
    },
    fmt('while ({condition}) {{\n  {code}\n}}', { condition = i(1, "condition"), code = i(0, "// white your code here") })
  ),
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
      trig = 'fn',
      name = 'Function',
      dscr = 'function'
    },
    fmt('{type} {name}({args}) {{\n {code}\n}}', {
      type = i(1, "void"),
      name = i(2, "name"),
      args = i(3, "int args"),
      code = i(0, "// white your code here")
    })
  ),
  s({
      trig = 'enum',
      name = 'Enum',
      dscr = 'Enum data structure'
    },
    fmt('enum {name} {{\n  {body}\n}};', { name = i(1, "Name"), body = i(0, "// write the body here") })
  ),
  s({
      trig = 'class',
      name = 'Class',
      dscr = 'Class data structure'
    },
    fmt('class {name} {{\n  public:\n    {}();\n    {code};\n  private:\n}};', {
      name = i(1, "Name"),
      rep(1),
      code = i(2, "// write your code here")
    })
  ),
  s({
      trig = 'method',
      name = 'Method',
      dscr = 'Method of a class'
    },
    fmt('{type} {class}::{method}({args}) {{\n  {code}\n}}', {
      type = i(1, "void"),
      class = i(2, "Class"),
      method = i(3, "method"),
      args = i(4, "int args"),
      code = i(0, "// write your code here")
    })
  ),
  s({
      trig = 'struct',
      name = 'Struct',
      dscr = 'Struct data structure'
    },
    fmt('struct {name} {{\n  {code}\n}};', { name = i(1, "Name"), code = i(0, "// write your code here") })
  ),
  s({
      trig = 'union',
      name = 'Union',
      dscr = 'Union data structure'
    },
    fmt('union {name} {{\n  {body}\n}};', { name = i(1, "Name"), body = i(0, "// write the body code here") })
  ),
  s({
      trig = 'namespace',
      name = 'Namespace',
      dscr = 'Namespace Scope'
    },
    fmt('namespace {name} {{\n  {code}\n}}', { name = i(1, "Name"), code = i(0, "// write your code here") })
  ),
  s({
      trig = 'ifdef',
      name = 'If is define',
      dscr = 'If is define macro'
    },
    fmt('#ifdef {condition}\n  {code}\n#endif // {}',
      { condition = i(1, "condition"), code = i(0, "// write your code here"), rep(1) })
  ),
  s({
      trig = 'ifndef',
      name = 'If is not define',
      dscr = 'If is not define macro'
    },
    fmt('#ifndef {condition}\n  {code}\n#endif // {}',
      { condition = i(1, "condition"), code = i(0, "// write your code here"), rep(1) })
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
      trig = 'tc',
      name = 'Try/Catch',
      dscr = 'Try Catch Scope'
    },
    fmt('try {{\n  {code}\n}} catch({error}) {{\n {exception} \n}}',
      { code = i(1, "// write your code here"), error = i(2, "int error"), exception = i(0, "throw(error)") })
  ),
}
