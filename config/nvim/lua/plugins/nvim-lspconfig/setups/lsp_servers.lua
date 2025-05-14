local lsp_servers = require 'plugins.nvim-lspconfig.lsp_servers'

local function setup_lsp_servers()
  for server, config in pairs(lsp_servers) do
    vim.lsp.enable(server)
    vim .lsp.config(server,config)
  end
end

return setup_lsp_servers
