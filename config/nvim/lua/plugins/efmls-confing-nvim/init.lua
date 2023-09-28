return {
  'creativenull/efmls-configs-nvim',
  dependencies = { 'neovim/nvim-lspconfig' },
  config = function()
    local efmls = require 'efmls-configs'
    local default_config = require 'plugins.nvim-lspconfig.default_config'
    local config = require 'plugins.efmls-confing-nvim.config'

    efmls.init {
      on_attach = default_config.on_attach,
      capabilities = default_config.capabilities,
      init_options = {
        documentFormatting = true,
      }
    }

    efmls.setup (config)
  end
}
