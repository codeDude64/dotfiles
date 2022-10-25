local ls = require 'luasnip'
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require 'luasnip.extras.fmt'.fmt
local types = require 'luasnip.util.types'

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "← Choiced node", "Error" } }
      }
    }
  }
}

local git_user = vim.fn.system("git config user.name | tr -d '\n'")

local all_snippets = {
  s("todo", fmt([[TODO ({}): {}]], { i(1, git_user), i(0, "things TODO ...") }))
}

local javascript_snippets = {
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


ls.add_snippets("all", all_snippets)
ls.add_snippets("javascript", javascript_snippets)
