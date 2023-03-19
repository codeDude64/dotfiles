local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local function default_on_attach(client) print('Attaching to ' .. client.name) end

return {
  on_attach = default_on_attach,
  capabilities = capabilities
}
