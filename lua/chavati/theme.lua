local vim = vim

vim.o.termguicolors = true
vim.g.material_style = 'deep ocean'
require("bufferline").setup{}
vim.cmd[[colorscheme material]]

require('material').setup({
		contrast = true,
		borders = false,
		italics = {
			comments = true,
			strings = false,
			keywords = true,
			functions = true,
			variables = false
		},
		contrast_windows = {
			"terminal",
			"packer",
			"qf"
		},
		text_contrast = {
			lighter = false,
			darker = false
		},
		disable = {
			background = true,
			term_colors = false,
			eob_lines = false
		},
		custom_highlights = {}
	})

