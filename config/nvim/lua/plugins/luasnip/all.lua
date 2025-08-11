local ls = require 'luasnip'
local i = ls.i
local s = ls.s
local fmt = require 'luasnip.extras.fmt'.fmt
local git_user = vim.fn.system("git config user.name | tr -d '\n'")

return {
  s({
      trig = 'todo',
      name = 'TODO',
      dscr = 'TODO comment'
    },
    fmt("TODO ({}): {}", { i(1, git_user), i(0, "things TODO ...") }))
}
