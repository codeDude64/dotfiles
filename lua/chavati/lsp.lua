vim.g.gruvbox_contrast_dark = 'hard'

if vim.fn.exists('+termguicolors') then
  vim.g["&t_8f"] = "<Esc>[38;2;%lu;%lu;%lum]"
  vim.g["&t_8b"] = "<Esc>[48;2;%lu;%lu;%lum]"
end

vim.g.gruvbox_invert_selection = '0'
vim.cmd 'colorscheme gruvbox'
