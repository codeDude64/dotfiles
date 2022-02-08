local vim = vim
local material = require "material"

vim.o.termguicolors = true
vim.g.material_style = 'darker'
vim.cmd[[colorscheme material]]

material.setup({
		contrast = {
			sidebars = false,
			floating_windows = false,
			line_numbers = false,
			sign_column = false,
			cursor_line = false,
			non_current_windows = false,
			popup_menu = false
		},
		italics = {
			comments = false,
			strings = false,
			keywords = false,
			functions = false,
			variables = false
		},
		contrast_filetypes = {},
		high_visibility = {
			lighter = false,
			darker = false
		},
		disable = {
			borders = false,
			background = true,
			term_colors = false,
			eob_lines = false
		},
		custom_highlights = {}
	})

