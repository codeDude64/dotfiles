local material = require 'material'

vim.g.material_style = 'palenight'

material.setup({
  contrast = {
    sidebars = false,
    floating_windows = false,
    line_numbers = true,
    sign_column = false,
    cursor_line = false,
    non_current_windows = false,
    popup_menu = false
  },
  italics = {
    comments = true,
    strings = false,
    keywords = true,
    functions = true,
    variables = false
  },
  contrast_filetypes = {},
  high_visibility = {lighter = false, darker = false},
  disable = {
    borders = false,
    background = true,
    term_colors = false,
    eob_lines = false
  },
  custom_highlights = {}
})

vim.cmd 'colorscheme material'
