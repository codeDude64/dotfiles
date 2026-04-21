return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = function()
    local npairs = require("nvim-autopairs")
    npairs.setup({
      disable_filetype = { 'TelescopePrompt', 'vim' },
      check_ts = true,
      ts_config = {
        lua = { 'string' }, -- it will not add pair on that treesitter node
        javascript = { 'template_string' },
      }

    })

    npairs.get_rules("(")[1].not_filetypes = { "ruby" }
  end
}
