local json_config    = require('plugins.nvim-lspconfig.json_config')
local lua_config     = require('plugins.nvim-lspconfig.lua_config')
local solargraph_config  = require('plugins.nvim-lspconfig.solargraph')
local clangd_config    = require('plugins.nvim-lspconfig.clangd_config')
local default_config = require('plugins.nvim-lspconfig.default_config')
local yamlls_config = require('plugins.nvim-lspconfig.yamlls_config')

return {
  ts_ls = default_config,
  cssls = default_config,
  html = default_config,
  intelephense = default_config,
  pyright = default_config,
  bashls = default_config,
  texlab = default_config,
  yamlls = yamlls_config,
  vimls = default_config,
  dockerls = default_config,
  solargraph = solargraph_config,
  cmake = default_config,
  lemminx = default_config,
  graphql = default_config,

  jsonls = json_config,
  lua_ls = lua_config,
  clangd = clangd_config
}
