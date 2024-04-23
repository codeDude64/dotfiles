local options = {
  clipboard = 'unnamedplus',
  mouse = 'a',
  syntax = 'on',
  ruler = true,
  showcmd = true,
  encoding = 'utf-8',
  showmatch = true,
  laststatus = 2,
  redrawtime = 2000,
  termguicolors = true,
  background = 'dark',
  shiftwidth = 2,
  tabstop = 2,
  expandtab = true
}

for name, value in pairs(options) do
  vim.o[name] = value
end
