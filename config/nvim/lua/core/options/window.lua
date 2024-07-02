local options = {
  number = true,
  relativenumber = true,
  numberwidth = 1,
}

for name, value in pairs(options) do
  vim.wo[name] = value
end
