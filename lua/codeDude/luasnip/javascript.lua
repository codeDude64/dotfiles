local ls = require 'luasnip'
local i = ls.i
local c = ls.choice_node
local s = ls.s
local t = ls.t
local sn = ls.snippet_node
local fmt = require 'luasnip.extras.fmt'.fmt

return {
  s("cl", fmt([[console.log({});]],
    c(1, {
      sn(1, { t('"'), i(1), t('"') }),
      sn(1, { t('"'), i(1), t('"'), t(', '), i(2) }),
      sn(1, { t('{'), i(1), t('}') })
    })
  )),
  s("cg",
    fmt("console.group(\"{}\");\nconsole.log(\"{}\");\nconsole.groupEnd();", { i(1, "groupName"), i(2, "message") }))
}
