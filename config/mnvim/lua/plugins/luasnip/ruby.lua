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

local getAccessors = function(accessors_plain)
  local accessors = {}

  for accessor_plain in string.gmatch(accessors_plain, "[%w_]+") do
    table.insert(accessors, accessor_plain)
  end

  return accessors
end

return {
  s({
    trig = 'puts',
    name = 'Print Log',
    dscr = 'Print message or a variable on the console'
  }, fmt([[puts {log}]],
    {
      log = c(1, {
        sn(nil, { t('"'), r(1, "log"), t('"') }),
        sn(nil, { r(1, "log") }),
        sn(nil, { t("'"), r(1, "log"), t("'") }),
      })
    })
  ),
  s({
      trig = 'if',
      name = 'If Condition',
      dscr = 'If Condition'
    },
    fmt('if {condition}\n  {code}\n{el}\nend', {
      condition = i(1, "condition"),
      code = i(2, "# write your code here"),
      el = c(3, {
        t(''),
        sn(1, fmt(' elsif {condition}\n   {elseif_code}\n else\n   {else_code}\n', {
          condition = i(1, "condition"),
          elseif_code = i(2, "# write your code here"),
          else_code = i(3, "# write your code here")
        })),
        sn(1, fmt(' elsif {condition}\n   {code}\n', {
          condition = i(1, "condition"),
          code = i(2, "# white your code here")
        })),
        sn(1, fmt(' else\n   {code}\n', { code = i(1, "# write your code here") })),
      })
    })
  ),
  s({
      trig = 'unless',
      name = 'Unless Condition',
      dscr = 'Unless Condition'
    },
    fmt("unless {condition}\n  {code}\nend", { condition = i(1, "condition"), code = i(0, "# write your code here") })
  ),
  s({
      trig = 'else',
      name = 'Else Condition',
      dscr = 'Else Condition'
    },
    fmt("else\n  {code}\n", { code = i(1, "# write your code here") })
  ),
  s({
      trig = 'elsif',
      name = 'Else If Condition',
      dscr = 'Else If Condition'
    },
    fmt('elif {condition}\n  {code}\n',
      { condition = i(1, "condition"), code = i(0, "# write your code here") })
  ),
  s({
      trig = 'ternary',
      name = 'Ternary Condition',
      dscr = 'Ternary Condition'
    },
    fmt([[{condition} ? {a} : {b}]], { condition = i(1, "condition"), a = i(2, "A"), b = i(3, "B") })
  ),
  s({
      trig = 'loop',
      name = 'Loop',
      dscr = 'Loop'
    },
    fmt('loop do\n  {code}\n  break {condition}\nend', {
      code = i(0, "# write your code here"),
      condition = i(1, "# condition")
    })
  ),
  s({
      trig = 'while',
      name = 'While',
      dscr = 'While'
    },
    fmt('while {condition} do\n  {code}\nend', {
      condition = i(1, "# condition"),
      code = i(0, "# write your code here")
    })
  ),
  s({
      trig = 'until',
      name = 'Until',
      dscr = 'Until'
    },
    fmt('until {condition} do\n  {code}\nend', {
      condition = i(1, "# condition"),
      code = i(0, "# write your code here")
    })
  ),
  s({
      trig = 'forin',
      name = 'For In Loop',
      dscr = 'Foor in loop'
    },
    fmt('for {element} in {list}\n  {code}\nend', {
      element = i(1, "element"),
      list = i(2, "list"),
      code = i(0, "# white your code here")
    })
  ),
  s({
      trig = 'casewhenthen',
      name = 'Case When Then',
      dscr = 'Case When Then Scope'
    },
    fmt('case {key}\n  when {key_value} then {value}\nend', {
      key = i(1, "key"),
      key_value = i(2, "key_value"),
      value = i(3, "# value")
    })
  ),
  s({
      trig = 'whenthen',
      name = 'When Then',
      dscr = 'When Then Scope'
    },
    fmt('when {key_value} then {value}\n', {
      key_value = i(1, "key_value"),
      value = i(2, "# value")
    })
  ),
  s({
      trig = 'casewhen',
      name = 'Case When',
      dscr = 'Case When Scope'
    },
    fmt('case {key}\nwhen {value}\n  {case_code}\nelse\n  {default_code}\nend', {
      key = i(1, "key"),
      value = i(2, "value"),
      case_code = i(3, "# write your code here"),
      default_code = i(0, "# write your code here")
    })
  ),
  s({
      trig = 'block',
      name = 'Block',
      dscr = 'Block'
    },
    c(1, {
      sn(1,
        fmt('{{ |{args}| {code} }}', {
          args = i(1, "args"),
          code = i(2, "code here")
        })
      ),
      sn(1,
        fmt('do |{args}|\n  {code}\nend', {
          args = i(1, "args"),
          code = i(2, "# write your code here")
        })
      )
    })
  ),
  s({
      trig = 'fn',
      name = 'Funtion',
      dscr = 'Funtion'
    },
    fmt('def {name}\n  {code}\nend', {
      name = i(1, "name"),
      code = i(0, "# white your code here")
    })
  ),
  s({
      trig = 'class',
      name = 'Class',
      dscr = 'Class'
    },
    fmt(
      'class {name}\n  attr_accessor {accessors}\n\n  def initialize({init_args})\n{init_body}\n  end\n\n  {code}\n\nend',
      {
        name = i(1, "name"),
        accessors = i(2, ""),
        init_args = f(function(args)
          local accessors_plain = args[1][1]

          if accessors_plain == "" then return "" end

          local accessors = getAccessors(accessors_plain)

          local init_args = ""
          for index, accessor in ipairs(accessors) do
            init_args = init_args .. accessor .. (index == #accessors and "" or ", ")
          end

          return init_args
        end, { 2 }),
        init_body = f(function(args)
          local accessors_plain = args[1][1]

          if accessors_plain == "" then return {} end

          local accessors = getAccessors(accessors_plain)

          local lines = {}
          for _, accessor in ipairs(accessors) do
            table.insert(lines, "    @" .. accessor .. " = " .. accessor)
          end

          return lines
        end, { 2 }),
        code = i(0, "# white your code here")
      })
  ),
  s({
      trig = 'hash',
      name = 'Hash',
      dscr = 'Hash data structure'
    },
    fmt('{{\n  {obj}\n}}', { obj = i(1) })
  ),
  s({
      trig = 'kv',
      name = 'Key/Value',
      dscr = 'Key/Value pair'
    },
    fmt([[{key} => {value},]], { key = i(1, "key"), value = i(2, "value") })),
}
