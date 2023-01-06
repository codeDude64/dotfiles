local status_cmp_ok, cmp = pcall(require, 'cmp')
if not status_cmp_ok then
  vim.notify('Error: cmp plugin is NIL')
  return
end
local lspkind = require 'lspkind'
local luasnip = require 'luasnip'
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
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

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
