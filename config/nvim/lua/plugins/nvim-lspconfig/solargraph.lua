local general = require("plugins.nvim-lspconfig.general")

return {
  capabilities = general.capabilities,
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
