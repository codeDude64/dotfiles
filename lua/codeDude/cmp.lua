local vim = vim
local lspkind = require 'lspkind'
local cmp = require 'cmp'
local luasnip = require 'luasnip'


cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  sorting = {
    comparators = {
      cmp.config.compare.sort_text,
      cmp.config.compare.score,
      cmp.config.compare.order,
      cmp.config.compare.offset,
      cmp.config.compare.kind,
      cmp.config.compare.length,
      cmp.config.compare.exact,
    },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = {
    -- cmp mappings
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'cmd_line' }
  },
  formatting = {
    format = lspkind.cmp_format({ with_text = true, maxwidth = 50, menu = {
      nvim_lsp = '[LSP]',
      luasnip = '[LuaSnip]',
      buffer = '[Buffer]',
      nvim_lua = '[Lua]',
      latex_symbols = '[Latex]',
    } })
  },
  map_cr = true,
  map_complete = true,
  auto_select = false,
})
