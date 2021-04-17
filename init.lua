local vim = vim

vim.g.mapleader = ' '
vim.g.colors_name = 'gruvbox'

local globalOptions = vim.o
local bufferOptions = vim.bo
local windowOptions = vim.wo


-- General configuration
globalOptions.clipboard = 'unnamed'
globalOptions.mouse = 'a'
globalOptions.syntax = 'on'
globalOptions.ruler = true
globalOptions.showcmd = true
globalOptions.encoding = 'utf-8'
globalOptions.showmatch = true
globalOptions.laststatus = 2
globalOptions.redrawtime = 2000
globalOptions.termguicolors = true
globalOptions.background = 'dark'

bufferOptions.shiftwidth = 2
bufferOptions.tabstop = 2
bufferOptions.expandtab = true

windowOptions.number = true
windowOptions.relativenumber = true
windowOptions.numberwidth = 1

require'chavati'
