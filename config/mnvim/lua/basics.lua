vim.g.mapleader = ' '

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.o.clipboard = 'unnamedplus'
vim.o.mouse = 'a'
vim.o.syntax = 'on'
vim.o.ruler = true
vim.o.showcmd = true
vim.o.encoding = 'utf-8'
vim.o.showmatch = true
vim.o.laststatus = 2
vim.o.redrawtime = 2000
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.numberwidth = 1

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set('n', '<A-l>', function() vim.cmd.resize({ args = { '+5' }, mods = { vertical = true } }) end)
vim.keymap.set('n', '<A-h>', function() vim.cmd.resize({ args = { '-5' }, mods = { vertical = true } }) end)
vim.keymap.set('n', '<A-k>', function() vim.cmd.resize({ args = { '-5' } }) end)
vim.keymap.set('n', '<A-j>', function() vim.cmd.resize({ args = { '+5' } }) end)
