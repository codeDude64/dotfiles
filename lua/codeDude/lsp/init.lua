local lspconfig   = require 'lspconfig'
local lsp_servers = require 'codeDude.lsp.lsp_servers'

local function load_lsp_servers()
  for server, config in pairs(lsp_servers) do
    lspconfig[server].setup(config)
  end

end

load_lsp_servers()
