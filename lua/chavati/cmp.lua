local vim = vim
local lspkind = require 'lspkind'
local cmp = require 'cmp'


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
    expand = function (args)
    	vim.fn["vsnip#anonymous"](args.body)
    end
  },
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' })
  },
  sources = {
    {name = 'nvim_lsp'},
    {name = 'vsnip'},
    {name = 'path'},
    {name = 'buffer'},
    {name = 'cmd_line'}
  },
  formatting = {
    format = lspkind.cmp_format({with_text = true, maxwidth = 50, menu = {
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      luasnip = "[LuaSnip]",
      nvim_lua = "[Lua]",
      latex_symbols = "[Latex]",
    }})
  },
  map_cr = true,
  map_complete = true,
  auto_select = false,
})
