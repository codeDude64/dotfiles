local options = {
  shiftwidth = 2,
  tabstop = 2,
  expandtab = true,
}

for name, value in pairs(options) do
  vim.bo[0][name] = value
end
