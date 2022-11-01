local ls = require 'luasnip'
local types = require 'luasnip.util.types'
local all_snippets require 'codeDude.luasnip.all_snippets'
local javascript_snippets require 'codeDude.luasnip.javascript_snippets'

-- TODO (codeDude): posibles luasnip functions
--local s = ls.s
--local i = ls.i
--local t = ls.t
--
--local d = ls.dynamic_node
--local c = ls.choice_node
--local f = ls.function_node
--local sn = ls.snippet_node

--local fmt = require 'luasnip.extras.fmt'.fmt

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





ls.add_snippets("all", all_snippets)
ls.add_snippets("javascript", javascript_snippets)
