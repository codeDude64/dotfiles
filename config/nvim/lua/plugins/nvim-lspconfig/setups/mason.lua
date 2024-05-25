local mason                = require 'mason'
local mason_lspconfig      = require 'mason-lspconfig'
local mason_tool_installer = require("mason-tool-installer")

local function setup_mason()
  mason.setup()
  mason_tool_installer.setup { automatic_installation = true }
  mason_lspconfig.setup { automatic_installation = true }
end

return setup_mason
