local general = require("plugins.nvim-lspconfig.general")

return {
  capabilities = general.capabilities,
  cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose' },
  init_options = {
    fallbackFlags = { '-std=c++17' },
  },
}
