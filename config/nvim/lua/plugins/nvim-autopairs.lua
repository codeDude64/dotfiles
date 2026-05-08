vim.pack.add({
  { src = 'https://github.com/windwp/nvim-autopairs' },
})

local npairs = require("nvim-autopairs")

npairs.setup({
  check_ts = true,
})
