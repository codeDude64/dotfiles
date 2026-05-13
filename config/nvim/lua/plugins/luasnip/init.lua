vim.pack.add({
  { src = 'https://github.com/L3MON4D3/LuaSnip' }
})

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(event)
    local name, kind = event.data.spec.name, event.data.kind
    if name == 'LuaSnip' and (kind == 'install' or kind == 'update') then
      vim.system({ "make install_jsregexp" }, { cwd = event.data.path })
      if not event.data.active then
        vim.cmd('packadd luasnip')
      end
    end
  end
})


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
