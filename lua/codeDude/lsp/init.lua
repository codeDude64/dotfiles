local lspconfig   = require 'lspconfig'
local lsp_servers = require 'codeDude.lsp.lsp_servers'

local function load_lsp_servers()
  for key, server in pairs(lsp_servers) do
    print("hola")
    lspconfig[key].setup(server)
  end

end

load_lsp_servers()
