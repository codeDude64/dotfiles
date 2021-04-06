local lspconfig = require'lspconfig'
local completion = require'completion'
local lsp_status = require'lsp-status'


-- Gruvbox and lsp
vim.g.gruvbox_contrast_dark = 'hard'

if vim.fn.exists('+termguicolors') then
  vim.g["&t_8f"] = "<Esc>[38;2;%lu;%lu;%lum]"
  vim.g["&t_8b"] = "<Esc>[48;2;%lu;%lu;%lum]"
end

vim.g.gruvbox_invert_selection = '0'
vim.cmd 'colorscheme gruvbox'

-- LSP config
lsp_status.register_progress()

local function default_on_attach(client)
  print('Attaching to ' .. client.name)
  completion.on_attach(client)
  lsp_status.on_attach(client)
end

local default_config = {
  on_attach = default_on_attach,
  capabilities = lsp_status.capabilities
}

lspconfig.tsserver.setup{ default_config }
lspconfig.jsonls.setup{ default_config }
lspconfig.cssls.setup{ default_config }
lspconfig.html.setup{ default_config }
lspconfig.omnisharp.setup{ default_config }
lspconfig.intelephense.setup{ default_config }
lspconfig.pyright.setup{ default_config }
lspconfig.bashls.setup{ default_config }
lspconfig.texlab.setup{ default_config }
lspconfig.yamlls.setup{ default_config }
lspconfig.vimls.setup{ default_config }
lspconfig.dockerls.setup{ default_config }


-- Lua lsp

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

local sumneko_root_path = vim.fn.stdpath('cache')..'/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}
