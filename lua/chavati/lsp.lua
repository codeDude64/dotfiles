local vim = vim
local lspconfig = require'lspconfig'
local completion = require'completion'
local lsp_status = require'lsp-status'
local cache_path = vim.fn.stdpath('cache')


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

lspconfig.tsserver.setup( default_config )
lspconfig.jsonls.setup( default_config )
lspconfig.cssls.setup( default_config )
lspconfig.html.setup( default_config )
lspconfig.omnisharp.setup( default_config )
lspconfig.intelephense.setup( default_config )
lspconfig.pyright.setup( default_config )
lspconfig.bashls.setup( default_config )
lspconfig.texlab.setup( default_config )
lspconfig.yamlls.setup( default_config )
lspconfig.vimls.setup( default_config )
lspconfig.dockerls.setup( default_config )
lspconfig.jdtls.setup( default_config )


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

local sumneko_root_path = cache_path ..'/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

lspconfig.sumneko_lua.setup {
  default_config,
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


-- Vue Lsp

lspconfig.vuels.setup {
  default_config,
  init_options = {
    config = {
      vetur = {
        completion = {
          autoImport = true,
          tagCasing = 'kebab',
          useScaffoldSnippets = true
        },
        format = {
          defaultFormatter = {
            js = {'prettier-eslint', 'prettier', 'vscode-typescript', 'none'},
            ts = {'prettier-tslint', 'prettier', 'vscode-typescript', 'none'},
            html = { 'prettier', 'prettyhtml', 'js-beautify-html', 'none' },
            css = {'prettier', 'none'},
            scss = {'prettier', 'none'}
          },
          enable = true
        }
      }
    }

  }
}


-- Diagnostic LSP
local eslint = {
    sourceName = 'eslint',
    command = 'eslint', -- or "./node_modules/.bin/eslint" to use from project install
    debounce = 100,
    args = {
        '--stdin',
        '--stdin-filename',
        '%filepath',
        '--format',
        'json',
    },
    parseJson = {
        errorsRoot = '[0].messages',
        line = 'line',
        column = 'column',
        endLine = 'endLine',
        endColumn = 'endColumn',
        message = '${message} [${ruleId}]',
        security = 'severity',
    },
    securities = {
        [2] = 'error',
        [1] = 'warning'
    },
    rootPatterns = {
        '.eslintrc.js',
        '.eslintrc.cjs',
        '.eslintrc.yaml',
        '.eslintrc.yml',
        '.eslintrc.json',
        '.eslintrc',
        'package.json',
    },
}

local prettier = {
    command = 'prettier', -- or "./node_modules/.bin/prettier" to use from project install
    args = { '--stdin-filepath', '%filepath' },
    rootPatterns = {
        '.prettierrc',
        '.prettierrc.json',
        '.prettierrc.toml',
        '.prettierrc.json',
        '.prettierrc.yml',
        '.prettierrc.yaml',
        '.prettierrc.json5',
        '.prettierrc.js',
        '.prettierrc.cjs',
        'prettier.config.js',
        'prettier.config.cjs',
    },
}

lspconfig.diagnosticls.setup {
    default_config,
    filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue'
    },
    init_options = {
        filetypes = {
            javascript = 'eslint',
            javascriptreact = 'eslint',
            typescript = 'eslint',
            typesriptreact = 'eslint',
            vue = 'eslint'
        },
        formatFiletypes = {
            javascript = { 'prettierEslint', 'prettier' },
            javascriptreact = { 'prettierEslint', 'prettier' },
            typescript = { 'prettierEslint', 'prettier' },
            typescriptreact = {'prettierEslint', 'prettier' }
        },
        linters = {
            eslint = eslint
        },
    }
}
