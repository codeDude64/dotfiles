local npairs = require('nvim-autopairs')
local npairs_cmp = require('nvim-autopairs.completion.cmp')

npairs.setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
  check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add pair on that treesitter node
        javascript = {'template_string'},
        java = false,-- don't check treesitter on java
    }
})

npairs_cmp.setup({
    map_cr = true,
    map_complete = true,
    auto_select = false,
})
