return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  config = function()
    local mason_tool_installer = require("mason-tool-installer")
    mason_tool_installer.setup{ ensure_installed = ensure_installed }
  end
}
