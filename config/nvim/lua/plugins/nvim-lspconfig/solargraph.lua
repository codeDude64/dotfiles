local default_config = require("plugins.nvim-lspconfig.default_config")

return {
  capabilities = default_config.capabilities,
  solargraph = {
    useBundler = true,
    completion = true,
    formatting = true,
    autoformat = true,
  },
  init_options = {
    formatting = true,
  }

}
