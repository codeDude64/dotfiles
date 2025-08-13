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
}
