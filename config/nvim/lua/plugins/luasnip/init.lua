return {
  'L3MON4D3/LuaSnip',
  build = "make install_jsregexp",
  version = "v2.*",
  keys = function()
    return require('keymaps.luasnip')
  end,
  config = function()
    local ls = require 'luasnip'
    local types = require 'luasnip.util.types'
    local snippets = require 'plugins.luasnip.snippets'


    ls.config.set_config {
      updateevents = "TextChanged,TextChangedI",
      ext_opts = {
        [types.choiceNode] = {
          active = {
            virt_text = { { "← Choiced node", "Error" } }
          }
        }
      }
    }

    for type, snippet in pairs(snippets) do
      ls.add_snippets(type, snippet)
    end
  end
}
