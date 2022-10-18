local vim = vim

vim.g.mapleader = ' '

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

bufferOptions[0].shiftwidth = 2
bufferOptions[0].tabstop = 2
bufferOptions[0].expandtab = true

globalOptions.shiftwidth = 2
globalOptions.tabstop = 2
globalOptions.expandtab = true

windowOptions.number = true
windowOptions.relativenumber = true
windowOptions.numberwidth = 1

require 'codeDude'
