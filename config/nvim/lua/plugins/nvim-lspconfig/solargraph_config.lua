local default_config = require('plugins.nvim-lspconfig.default_config')

return {
  capabilities = default_config.capabilities,
  settings = {
    solargraph = {
      diagnostics = true,
      completion = true,
      formatting = true
    }
  }
}
