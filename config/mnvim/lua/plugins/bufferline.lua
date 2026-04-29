vim.pack.add({
  { src = 'https://github.com/akinsho/bufferline.nvim' },
})

local bufferline = require("bufferline")

bufferline.setup({
  options = {
    themable = true,
    numbers = 'both',
    diagnostics = 'nvim_lsp',
    groups = {
      options = {
        toggle_hidden_on_enter = true
      },
      items = {
        {
          name = "Tests",
          highlight = { underline = true, sp = "blue" },
          priority = 2,
          icon = " ",
          matcher = function(buf)
            return buf.name:match('%_test') or buf.name:match('%_spec')
          end,
        },
        {
          name = "Docs",
          highlight = { undercurl = true, sp = "green" },
          auto_close = false,
          matcher = function(buf)
            return buf.name:match('%.md') or buf.name:match('%.txt')
          end,
          separator = {
            style = require('bufferline.groups').separator.tab
          },
        }
      }
    },
    pick = {
      alphabet = 'asdfgxcvbqwerthjklnmyuiop'
    }
  }
})

vim.keymap.set('n', '<leader>f', ':BufferLinePick<cr>')
