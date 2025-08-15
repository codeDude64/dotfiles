local javascript = require 'plugins.luasnip.javascript'
local ls = require 'luasnip'
local i = ls.i
local s = ls.s
local t = ls.t
local f = ls.function_node
local c = ls.choice_node
local sn = ls.snippet_node
local fmt = require 'luasnip.extras.fmt'.fmt

local getFilename = function()
  return f(function(_, snippet)
    local name = vim.split(snippet.snippet.env.TM_FILENAME, ".", { plain = true })[1]
    local first_letter = string.upper(string.sub(name, 1, 1))
    local rest_word = string.sub(name, 2, -1)
    name = first_letter .. rest_word
    return name or ""
  end)
end

local typescriptreact = {
  s({
    trig = 'imse',
    name = 'Import useState and useEffect',
    dscr = 'Import the useState and useEffect hooks'
  }, t [[import { useState, useEffect } from 'react']]),
  s({
    trig = 'rfc',
    name = 'React Functiona Component',
    dscr = 'React Functiona Component'
  }, fmt("export default function {component}({props}) {{\n  return ({body});\n}}", {
    component = getFilename(),
    props = c(1, {
      sn(1, { t('{ '), i(1, "/*props*/"), t(' }'), t(': '), i(2, '/*propType*/') }),
      sn(1, i(1, "/*props*/"))
    }),
    body = i(0, "/*whrite your code here*/"),
  })),
  s({
    trig = 'usf',
    name = 'useState',
    dscr = 'useState hook'
  }, fmt([[const [{state}, set{State}] = useState<{T}>({initial_state});]], {
    state = i(1, "state"),
    State = f(function(args)
      local previous_node_value = args[1][1]
      local first_letter = string.upper(string.sub(previous_node_value, 1, 1))
      local rest_word = string.sub(previous_node_value, 2, -1)
      local current_node_value = first_letter .. rest_word
      return current_node_value
    end, { 1 }),
    T = i(2, "T"),
    initial_state = i(3, "initialState")
  })),
  s({
      trig = 'uef',
      name = 'useEffect',
      dscr = 'useEffect hook'
    },
    fmt("useEffect(() => {{\n  {body}\n}}, [{dependencies}]);",
      { body = i(0, "// Write your code here"), dependencies = i(1, "") }))
}

vim.list_extend(typescriptreact, javascript)

return typescriptreact
