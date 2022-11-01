local default_config = require 'codeDude.lsp.default_config'

return {
  on_attach = default_config.on_attach,
  capabilities = default_config.capabilities,
  settings = {
    schemas = {
      {
        fileMatch = { 'package.json' },
        url = 'https://json.schemastore.org/package.json'
      }, {
        fileMatch = { 'tsconfig*.json' },
        url = 'https://json.schemastore.org/tsconfig.json'
      }, {
        fileMatch = {
          '.prettierrc', '.prettierrc.json', 'prettierrc.config.json'
        },
        url = 'https://json.schemastore.org/prettierrc.json'
      }, {
        fileMatch = { '.eslintrc', '.eslintrc.json' },
        url = 'https://json.schemastore.org/eslintrc.json'
      }, {
        fileMatch = { '.babelrc', '.babelrc.json', 'babel.config.json' },
        url = 'https://json.schemastore.org/babelrc.json'
      }
    }
  },
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line('$'), 0 })
      end
    }
  }
}

