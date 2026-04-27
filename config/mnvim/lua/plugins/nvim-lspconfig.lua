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
  end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

---@type vim.lsp.Config
local config = {
  capabilities = capabilities,
  ---@type lspconfig.settings.lua_ls
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        preloadFileSize = 10000,
        library = {
          vim.env.VIMRUNTIME,
        }
      },
    },
  },
}

vim.lsp.config('lua_ls', config)
vim.lsp.enable('lua_ls')
