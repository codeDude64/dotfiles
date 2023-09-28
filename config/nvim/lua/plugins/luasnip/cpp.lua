local ls = require 'luasnip'
local i = ls.i
local c = ls.choice_node
local s = ls.s
local t = ls.t
local sn = ls.snippet_node
local rep = require 'luasnip.extras'.rep
local fmt = require 'luasnip.extras.fmt'.fmt

return {
  s({
    trig = 'cout',
    name = 'Cout',
    dscr = 'output of standar library'
  },
    fmt("std::cout << {} << '\\n';", i(1))),
  s({
    trig = 'cin',
    name = 'Cin',
    dscr = 'input of standar library'
  },
    fmt("std::cin >> {};", i(1))),
  s({
    trig = 'main',
    name = 'Main',
    dscr = 'Main function'
  },
    fmt('int main(int argc, char* argv[]) {{\n  return {};\n}}', {i(0)})),
  s({
    trig = 'for',
    name = 'For Loop',
    dscr = 'Usual for loop'
  },
    fmt('for ({} {} = 0; {} < {}; {}++)  {{\n  {}\n}}', {
      i(1),
      i(2),
      rep(2),
      i(3),
      rep(2),
      i(0)
    })),
  s({
    trig = 'forrange',
    name = 'Range-Based For loop',
    dscr = 'Range-Based For loop Similar to ForEach'
  },
    fmt('for ({} {} : {}) {{\n  {}\n}}', { i(1), i(2), i(3), i(0) })),
  s({
    trig = 'do',
    name = 'Do While Loop',
    dscr = 'Usual do while loop'
  },
    fmt('do {{\n  {}\n}} while({});', { i(0), i(1) })),
  s({
    trig = 'while',
    name = 'While Loop',
    dscr = 'Usual while loop'
  },
    fmt('while ({}) {{\n  {}\n}}', { i(1), i(0) })),
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
    trig = 'enum',
    name = 'Enum',
    dscr = 'Enum data structure'
  },
    fmt('enum {} {{\n  {}\n}};', { i(1), i(0) })),
  s({
    trig = 'class',
    name = 'Class',
    dscr = 'Class data structure'
  },
    fmt('class {} {{\n  public:\n    {}(){{\n      {}\n    }}\n  private:\n}};', { i(1), rep(1), i(0) })),
  s({
    trig = 'struct',
    name = 'Struct',
    dscr = 'Struct data structure'
  },
    fmt('struct {} {{\n  {}\n}};', { i(1), i(0) })),
  s({
    trig = 'union',
    name = 'Union',
    dscr = 'Union data structure'
  },
    fmt('union {} {{\n  {}\n}};', { i(1), i(0) })),
  s({
    trig = 'namespace',
    name = 'Namespace',
    dscr = 'Namespace Scope'
  },
    fmt('namespace {{\n  {}\n}}', i(0))),
  s({
    trig = 'ifdef',
    name = 'If is define',
    dscr = 'If is define macro'
  },
    fmt('#ifdef {}\n  {}\n#endif // {}', { i(1), i(0), rep(1) })),
  s({
    trig = 'ifndef',
    name = 'If is not define',
    dscr = 'If is not define macro'
  },
    fmt('#ifndef {}\n  {}\n#endif // {}', { i(1), i(0), rep(1) })),
  s({
    trig = 'switch',
    name = 'Switch Case',
    dscr = 'Switch Case Scope'
  },
    fmt('switch ({}) {{\n  case {}:\n  break; {}\ndefault:\n  break;\n}}', {
      i(1),
      i(2),
      i(0)
    })),
  s({
    trig = 'tc',
    name = 'Try/Catch',
    dscr = 'Try Catch Scope'
  },
    fmt('try {{\n  {}\n}} catch({}) {{\n\n}}', { i(0), i(1) })),
}
