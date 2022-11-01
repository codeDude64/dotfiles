local default_config = require 'codeDude.lsp.default_config'

return {
  on_attach = default_config.on_attach,
  capabilities = default_config.capabilities,
  init_options = {
    compilationDatabaseDirectory = "build",
    index = { threads = 0 },
    clang = { excludeArgs = { "-frounding-math" } }
  }
}
