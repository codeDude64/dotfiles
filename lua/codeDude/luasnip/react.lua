local ls = require 'luasnip'
local i = ls.i
local s = ls.s
local t = ls.t
local f = ls.function_node
local c = ls.choice_node
local sn = ls.snippet_node
local fmt = require 'luasnip.extras.fmt'.fmt

local filename = function()
  return f(function(_, snip)
    local name = vim.split(snip.snippet.env.TM_FILENAME, ".", true)
    return name[1] or ""
  end)
end

return {
  s('imr', t [[import React from 'react']]),
  s('imrse', t [[import React, { useState, useEffect } from 'react']]),
  s('impt', t [[import PropTypes from 'prop-types';]]),
  s('rpt', fmt('{}.propTypes = {{\n  {}\n}};', {
    filename(),
    i(1)
  })),
  s('rfc', fmt("import React from 'react';\n\nconst {} = ({}) => {{\n  return({});\n}}\n\nexport default {};", {
    filename(),
    c(1, {
      sn(1, i(1)),
      sn(1, { t('{ '), i(1), t(' }') })
    }),
    i(0),
    filename()
  })),
  s('usf', fmt([[const [{}, set{}] = useState({});]], {
    i(1),
    f(function(args)
      local previous_node_value = args[1][1]
      local first_letter = string.upper(string.sub(previous_node_value, 1, 1))
      local rest_word = string.sub(previous_node_value, 2, -1)
      local current_node_value = first_letter .. rest_word
      return current_node_value
    end, 1),
    i(2)
  })),
  s('uef', fmt("useEffect(() => {{\n  {}\n}}, [{}]);", {i(1), i(2)}))
}
