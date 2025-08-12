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
    local name = vim.split(snippet.snippet.env.TM_FILENAME, ".", { plain = true })
    return name[1] or ""
  end)
end

local javascriptreact = {
  s({
    trig = 'imr',
    name = 'Import React',
    dscr = 'Import React Library'
  }, t [[import React from 'react']]),
  s({
    trig = 'imrse',
    name = 'Import React State and Effect',
    dscr = 'Import React Library with the states and effect hooks'
  }, t [[import React, { useState, useEffect } from 'react']]),
  s({
    trig = 'impt',
    name = 'Import PropTypes',
    dscr = 'Import PropTypes'
  }, t [[import PropTypes from 'prop-types';]]),
  s({
    trig = 'propTypes',
    name = 'PropTypes',
    dscr = 'Define PropTypes'

  }, fmt('{filename}.propTypes = {{\n  {body}\n}};', {
    filename = getFilename(),
    body = i(1, "// write the proptypes here")
  })),
  s({
    trig = 'rfc',
    name = 'React Functiona Component',
    dscr = 'React Functiona Component'
  }, fmt("import React from 'react';\n\nconst {component} = ({props}) => {{\n  return({body});\n}}\n\nexport default {comp};", {
    component = getFilename(),
    props = c(1, {
      sn(1, { t('{ '), i(1, "/*props*/"), t(' }') }),
      sn(1, i(1, "/*props*/"))
    }),
    body = i(0, "/*whrite your code here*/"),
    comp = getFilename()
  })),
  s({
    trig = 'usf',
    name = 'useState',
    dscr = 'useState hook'
  }, fmt([[const [{state}, set{State}] = useState({initial_state});]], {
    state = i(1, "state"),
    State = f(function(args)
      local previous_node_value = args[1][1]
      local first_letter = string.upper(string.sub(previous_node_value, 1, 1))
      local rest_word = string.sub(previous_node_value, 2, -1)
      local current_node_value = first_letter .. rest_word
      return current_node_value
    end, {1}),
    initial_state = i(2, "initialState")
  })),
  s({
    trig = 'uef',
    name = 'useEffect',
    dscr = 'useEffect hook'
  }, fmt("useEffect(() => {{\n  {body}\n}}, [{dependencies}]);", { body = i(0, "// Write your code here"), dependencies = i(1, "") }))
}

vim.list_extend(javascriptreact, javascript)

return javascriptreact
