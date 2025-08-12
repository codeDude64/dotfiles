local javascript = {}

for _, module in ipairs({
  'commons',
  'comparations',
  'emacscript',
  'jest',
  'nodejs',
}) do
  local snippets = require("plugins.luasnip.javascript." .. module)
  vim.list_extend(javascript, snippets)
end

return javascript
