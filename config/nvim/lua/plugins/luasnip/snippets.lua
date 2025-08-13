local all = require 'plugins.luasnip.all'
local javascript = require 'plugins.luasnip.javascript'
local javascriptreact = require 'plugins.luasnip.javascriptreact'
local typescriptreact = require 'plugins.luasnip.typescriptreact'
local cpp = require 'plugins.luasnip.cpp'
local python = require 'plugins.luasnip.python'
local ruby   = require 'plugins.luasnip.ruby'

return {
  all = all,
  javascript = javascript,
  javascriptreact = javascriptreact,
  typescript = javascript,
  typescriptreact = typescriptreact,
  cpp = cpp,
  python = python,
  ruby = ruby
}
