local ls = require 'luasnip'
local s = ls.s
local fmt = require 'luasnip.extras.fmt'.fmt
local i = ls.insert_node
local types = require 'luasnip.util.types'

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { "←", "Error" } }
      }
    }
  }
}

local git_user = vim.fn.system("git config user.name | tr -d '\n'")

ls.add_snippets("all", {
  s("todo", fmt("TODO ({}): {}", {git_user, i(2)}))
})

