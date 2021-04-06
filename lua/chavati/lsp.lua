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
