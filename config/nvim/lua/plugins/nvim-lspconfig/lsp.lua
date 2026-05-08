vim.filetype.add({
  filename = {
    ['buf.yaml'] = 'buf-config',
    ['buf.gen.yaml'] = 'buf-config',
    ['buf.policy.yaml'] = 'buf-config',
    ['buf.lock'] = 'buf-config',
  }
})

local general = require("plugins.nvim-lspconfig.general")
local lua_ls = require("plugins.nvim-lspconfig.lua_ls")
local solargraph = require("plugins.nvim-lspconfig.solargraph")
local yamlls = require("plugins.nvim-lspconfig.yamlls")
local jsonls = require("plugins.nvim-lspconfig.jsonls")
local clangd = require("plugins.nvim-lspconfig.clangd")

return {
  lua_ls = lua_ls,
  solargraph = solargraph,
  ts_ls = general,
  cssls = general,
  html = general,
  pyright = general,
  bashls = general,
  texlab = general,
  yamlls = yamlls,
  dockerls = general,
  cmake = general,
  lemminx = general,
  jsonls = jsonls,
  clangd = clangd,
  buf_ls = general,
  metals = general
}
