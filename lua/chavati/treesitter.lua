local treesitter = require'nvim-treesitter.configs'
local parsers = require'nvim-treesitter.parsers'

treesitter.configs.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}

local parser_configs = parsers.get_parser_configs()
parser_configs.html.used_by = 'svelte'
