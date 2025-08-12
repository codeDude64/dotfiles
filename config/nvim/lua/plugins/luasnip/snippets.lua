local all = require 'plugins.luasnip.all'
local javascript = require 'plugins.luasnip.javascript'
local javascriptreact = require 'plugins.luasnip.react'
local cpp = require 'plugins.luasnip.cpp'

return {
  all = all,
  javascript = javascript,
  typescript = javascript,
  typescriptreact = javascript,
  javascriptreact = javascriptreact,
  cpp = cpp
}
