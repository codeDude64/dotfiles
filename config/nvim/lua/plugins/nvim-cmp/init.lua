return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "petertriho/cmp-git",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "windwp/nvim-autopairs",
    "onsails/lspkind-nvim",
  },
  config = function()
    local status_cmp_ok, cmp = pcall(require, "cmp")

    if not status_cmp_ok then
      vim.notify("Error: cmp plugin is NIL")
      return
    end

    local luasnip = require("luasnip")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local lspkind = require("lspkind")

    lspkind.init {}

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      window = {
        completion = cmp.config.window.bordered({ border = "double" }),
        documentation = cmp.config.window.bordered({ col_offset = 5 }),
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
        end,
      },
      mapping = {
        -- cmp mappings
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "cmd_line" },
        { name = "buffer" },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
          maxWidth = {
            menu = 50,
            abbr = 50,
          },
          ellipsis_char = '...',
          show_labelDetails = true,
        }),
      },
      map_cr = true,
      map_complete = true,
      auto_select = false,
    })

    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "cmp_git" },
      }, {
        { name = "buffer" },
      }),
    })

    cmp.setup.cmdline({ "/", "?" }, {
      completion = {
        completeopt = "menu,menuone,noselect,noinsert",
      },
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      completion = {
        completeopt = "menu,menuone,noselect,noinsert",
      },
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
