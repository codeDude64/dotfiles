local json_config    = require('codeDude.lsp.json_config')
local lua_config     = require('codeDude.lsp.lua_config')
local ccls_config    = require('codeDude.lsp.ccls_config')
local default_config = require('codeDude.lsp.default_config')

return {
  tsserver = default_config,
  cssls = default_config,
  html = default_config,
  vuels = default_config,
  omnisharp = default_config,
  intelephense = default_config,
  pyright = default_config,
  bashls = default_config,
  texlab = default_config,
  yamlls = default_config,
  vimls = default_config,
  dockerls = default_config,
  jdtls = default_config,
  solargraph = default_config,
  cmake = default_config,
  lemminx = default_config,

  jsonls = json_config,
  sumneko_lua = lua_config,
  ccls = ccls_config,
}
