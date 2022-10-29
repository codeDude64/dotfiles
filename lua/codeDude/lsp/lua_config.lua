local default_config = require 'codeDude.lsp.default_config'

return  {
  on_attach = default_config.on_attach,
  capabilities = default_config.capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        maxPreload = 10000,
        library = vim.api.nvim_get_runtime_file('', true)
      },
      telemetry = { enable = false }
    }
  }
}

