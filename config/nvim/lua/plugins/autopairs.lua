return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  opts = {
    disable_filetype = { 'TelescopePrompt', 'vim' },
    check_ts = true,
    ts_config = {
      lua = { 'string' }, -- it will not add pair on that treesitter node
      javascript = { 'template_string' },
    }
  }
}
