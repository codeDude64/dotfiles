local general = require("plugins.nvim-lspconfig.general")


---@type vim.lsp.Config
return {
  capabilities = general.capabilities,
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
