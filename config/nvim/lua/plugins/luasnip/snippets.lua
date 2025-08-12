local all = require 'plugins.luasnip.all'
local javascript = require 'plugins.luasnip.javascript'
local javascriptreact = require 'plugins.luasnip.javascriptreact'
local cpp = require 'plugins.luasnip.cpp'

return {
  all = all,
  javascript = javascript,
  javascriptreact = javascriptreact,
  typescript = javascript,
  typescriptreact = javascript,
  cpp = cpp
}
