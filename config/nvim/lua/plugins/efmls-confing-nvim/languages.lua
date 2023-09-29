local eslint_d = require 'efmls-configs.linters.eslint_d'
local eslint_d_formatter = require 'efmls-configs.formatters.eslint_d'
local stylua = require 'efmls-configs.formatters.stylua'
local luacheck = require 'efmls-configs.linters.luacheck'
local rubocop = require 'efmls-configs.linters.rubocop'

local js_languages = { eslint_d, eslint_d_formatter }

return {
  javascript = js_languages,
  javascriptreact = js_languages,
  typescript = js_languages,
  typescriptreact = js_languages,
  lua = { stylua, luacheck },
  ruby = { rubocop }
}
