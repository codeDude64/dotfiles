local default_config = require 'plugins.nvim-lspconfig.default_config'

return {
  on_attach = default_config.on_attach,
  capabilities = default_config.capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://www.rubyschema.org/rubocop.json"] = ".rubocop.yml",
        ["https://www.rubyschema.org/packwerk/package.json"] = "package.yml",
        ["https://www.rubyschema.org/rails/cable.json"] = "cable.yml",
        ["https://www.rubyschema.org/rails/cache.json"] = "cache.yml",
        ["https://www.rubyschema.org/rails/database.json"] = "database.yml",
        ["https://www.rubyschema.org/rails/queue.json"] = "queue.yml",
        ["https://www.rubyschema.org/rails/recurring.json"] = "recurring.yml",
        ["https://www.rubyschema.org/rails/storage.json"] = "storage.yml",
      }
    }
  }
}
