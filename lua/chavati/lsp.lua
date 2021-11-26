local vim = vim
local lspconfig = require'lspconfig'
local cache_path = vim.fn.stdpath('cache')
local cmp_nvim_lsp = require 'cmp_nvim_lsp'
local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())


local function default_on_attach(client)
  print('Attaching to ' .. client.name)
end

local default_config = {
  on_attach = default_on_attach,
  capabilities = capabilities
}

lspconfig.tsserver.setup( default_config )
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
lspconfig.solargraph.setup( default_config )

lspconfig.jsonls.setup {
  default_config,
  settings = {
    schemas = {
      {
        fileMatch = {'package.json'},
        url = 'https://json.schemastore.org/package.json'
      },
      {
        fileMatch = {'tsconfig*.json'},
        url = 'https://json.schemastore.org/tsconfig.json'
      },
      {
        fileMatch = {
          '.prettierrc',
          '.prettierrc.json',
          'prettierrc.config.json',
        },
        url = 'https://json.schemastore.org/prettierrc.json'
      },
      {
        fileMatch = {
          '.eslintrc',
          '.eslintrc.json',
        },
        url = 'https://json.schemastore.org/eslintrc.json'
      },
      {
        fileMatch = {
          '.babelrc',
          '.babelrc.json',
          'babel.config.json',
        },
        url = 'https://json.schemastore.org/babelrc.json'
      },
    },
  },
  commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}

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
local runtime_path = vim.split(package.path, ';')

lspconfig.sumneko_lua.setup {
  default_config,
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        maxPreload = 10000,
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
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

lspconfig.efm.setup {
    default_config,
    filetypes = {"javascript", "javascriptreact", "lua"},
    init_options = {
      documentFormatting = true,
    },
    settings = {
      rootMarkers = {".git/"},
      languages = {
        lua = {
          {formatCommand = "lua-format -i", formatStdin = true}
        },
        javascript = {
          {
            lintCommand = "eslint -f visualstudio --stdin --stdin-filename ${INPUT}",
            lintIgnoreExitCode = true,
            lintStdin = true,
            lintFormats = {"%f(%l,%c): %tarning %m","%f(%l,%c): %rror %m"},
            formatCommand = "eslint_d --stdin --fix-to-stdout --stdin-filename=${INPUT}",
            formatStdin = true,
          }
        }
      }
    }
}
