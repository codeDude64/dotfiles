local default_config = require 'codeDude.lsp.default_config'
local eslint_configuration = {
  lintCommand = 'eslint_d -f visualstudio --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { '%f(%l,%c): %tarning %m', '%f(%l,%c): %rror %m' },
  formatCommand = 'eslint_d --stdin --fix-to-stdout --stdin-filename=${INPUT}',
  formatStdin = true
}


return {
  on_attach = default_config.on_attach,
  capabilities = default_config.capabilities,
  single_file_support = false,
  filetypes = { 'javascript', 'javascriptreact', 'typescript' },
  init_options = {
    documentFormatting = true,
    hover = true,
    codeaction = true,
    completion = true
  },
  settings = {
    rootMarkers = { '.git/' },
    languages = {
      javascript = { eslint_configuration },
      typescript = { eslint_configuration },
      vuels = { eslint_configuration }
    }
  }

}
