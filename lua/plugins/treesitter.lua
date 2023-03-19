return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = "BufReadPre",
  dependecies = {
    'nvim-treesitter/playground',
    'nvim-treesitter/completion-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects'
  },
  config = function()
    local configs = require 'nvim-treesitter.configs'

    configs.setup {
      highlight = {
        ensure_installed = {
          'javascript',
          'typescript',
          'html',
          'xml',
          'css',
          'ruby',
          'cpp',
          'c',
          'cmake',
          'lua',
          'vimscript',
          'php',
          'bash',
          'phython',
          'yaml',
          'latex',
        },
        enable = true,
        custom_captures = {
          -- Highlight the @foo.bar capture group with the 'Identifier' highlight group.
          ['foo.bar'] = 'Identifier'
        }
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = 'gnn',
          node_incremental = 'grn',
          scope_incremental = 'grc',
          node_decremental = 'grm'
        }
      },
      indent = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner'
          }
        }
      },
      updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?'
      }
    }
  end
}
