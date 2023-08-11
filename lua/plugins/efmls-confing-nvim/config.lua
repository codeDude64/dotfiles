local eslint_d = require 'efmls-configs.linters.eslint_d'
local eslint_d_formatter = require 'efmls-configs.formatters.eslint_d'
local stylua = require 'efmls-configs.formatters.stylua'
local luacheck = require 'efmls-configs.linters.luacheck'
local rubocop = require 'efmls-configs.linters.rubocop'
local clang_tidy = require 'efmls-configs.linters.clang_tidy'
local clang_tidy_formatter = require 'efmls-configs.formatters.clang_tidy'

local js_languages = {
  linter = eslint_d,
  formatter = eslint_d_formatter,
}

local c_languages = {
  linter = clang_tidy,
  formatter = clang_tidy_formatter,

}

return {
  javascript = js_languages,
  javascriptreact = js_languages,
  typescript = js_languages,
  typescriptreact = js_languages,
  lua = {
    formatter = stylua,
    linter = luacheck,
  },
  ruby = {
    linter = rubocop
  },
  cpp = c_languages,
  c = c_languages
}
