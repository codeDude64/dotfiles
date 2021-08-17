local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

npairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
  check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    }
})

require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` after select function or method item
  auto_select = false,  -- auto select first item
})
