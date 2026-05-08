vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' }
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)

    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

    vim.keymap.set('n', 'sd', function()
      vim.diagnostic.open_float({ scope = 'line', bufnr = opts.buffer })
    end, opts)

    vim.keymap.set('n', '<leader>sd', function()
      vim.diagnostic.open_float({ scope = 'cursor', bufnr = opts.buffer })
    end, opts)

    vim.keymap.set('n', '[e', function() vim.diagnostic.jump({ count = -1 }) end, opts)
    vim.keymap.set('n', ']e', function() vim.diagnostic.jump({ count = 1 }) end, opts)

    vim.keymap.set('n', '[E', function()
      vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
    end, opts)

    vim.keymap.set('n', ']E', function()
      vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
    end, opts)

    vim.keymap.set('n', '<C-f>', function()
      vim.lsp.buf.format { async = true }
    end, opts)

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "🤬",
          [vim.diagnostic.severity.WARN] = "🧐",
          [vim.diagnostic.severity.HINT] = "🎯",
          [vim.diagnostic.severity.INFO] = "🤓",
        }
      }
    })
  end,
})

local lsp = require('plugins.nvim-lspconfig.lsp')

for lsp_name, config in pairs(lsp) do
  vim.lsp.enable(lsp_name)
  vim.lsp.config(lsp_name, config)
end

