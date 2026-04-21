local default_config = require 'plugins.nvim-lspconfig.default_config'

return {
  capabilities = default_config.capabilities,
  cmd = { 'clangd', '--background-index', '--clang-tidy', '--log=verbose' },
  init_options = {
    fallbackFlags = { '-std=c++17' },
  },
}
