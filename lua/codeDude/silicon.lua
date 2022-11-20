local silicon = require 'silicon'

local filename = vim.fn.expand('%')

silicon.setup = {
  output = '~/Pictures/Silicon/'..filename
}
