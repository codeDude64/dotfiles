return {
  'L3MON4D3/LuaSnip',
	version = "<CurrentMajor>.*",
	build = "make install_jsregexp",
  keys = function ()
    return require('keymaps.luasnip')
  end,
  config = function()
    local ls = require 'luasnip'
    local types = require 'luasnip.util.types'
    local snippets = require 'plugins.luasnip.snippets'

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

    local function load_snippets()
      for type, snippet in pairs(snippets) do
        ls.add_snippets(type, snippet)
      end
    end

    load_snippets()
  end
}
