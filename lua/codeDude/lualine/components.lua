M = {}

function M.scrollbar()
  local current_line = vim.fn.line('.')
  local total_lines = vim.fn.line('$')
  local default_chars = { '  ', '__', '▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██' }
  local index = 1

  if current_line == 1 then
    index = 1
  elseif current_line == total_lines then
    index = #default_chars
  else
    local line_no_fraction = vim.fn.floor(current_line) / vim.fn.floor(total_lines)
    index = vim.fn.float2nr(line_no_fraction * #default_chars)
    P(index)
    if index == 0 then
      index = 1
    end
  end
  return default_chars[index]
end

return M
