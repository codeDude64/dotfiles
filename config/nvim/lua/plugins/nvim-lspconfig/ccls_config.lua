local default_config = require 'plugins.nvim-lspconfig.default_config'

return {
  capabilities = default_config.capabilities,
  init_options = {
    compilationDatabaseDirectory = "build",
    index = { threads = 0 },
    clang = { excludeArgs = { "-frounding-math" } }
  }
}
