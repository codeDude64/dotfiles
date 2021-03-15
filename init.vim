call plug#begin('~/.vim/plugged')
" Theme
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
" LSP Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim' 
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
" Nvim treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" NerdTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Git
Plug 'tpope/vim-fugitive'
" Surround
Plug 'tpope/vim-surround'
" Auto Pairs
Plug 'jiangmiao/auto-pairs'
" Tmux navigator
Plug 'christoomey/vim-tmux-navigator'
" Latex
Plug 'lervag/vimtex'
" BufferLine
Plug 'bling/vim-bufferline'
" React
Plug 'othree/vim-jsx'
" Prettier
Plug 'prettier/vim-prettier'
" Snippers
Plug 'SirVer/ultisnips'
Plug 'epilande/vim-react-snippets'
call plug#end()

" My configuration
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set redrawtime=2000
set shiftwidth=2
set tabstop=2
set expandtab
syntax on
let mapleader=" "

" Gruvbox + lsp settings
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
let g:gruvbox_invert_selection='0'

colorscheme gruvbox
set background=dark

" LSP Config

set completeopt=menuone,noinsert,noselect

nnoremap <silent>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <silent><C-k> :lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent>K :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>ac :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>sd :lua vim.lsp.util.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <silent><C-f> :lua vim.lsp.buf.formatting()<CR>

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:completion_enable_snippet = 'UltiSnips'
let g:completion_trigger_character = ['.', '::']

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.jsonls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.cssls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.html.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.omnisharp.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.intelephense.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.pyright.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.bashls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.texlab.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.yamlls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.vimls.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.dockerls.setup{ on_attach=require'completion'.on_attach }

lua << EOF
require'lspconfig'.vuels.setup { 
  on_attach = require'completion'.on_attach,
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
EOF

lua << EOF
local function on_attach(client)
    print('Attached to ' .. client.name)
end

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

local prettierEslint = {
  command = 'prettier-eslint',
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
       '.eslintrc.js',
       '.eslintrc.cjs',
       '.eslintrc.yaml',
       '.eslintrc.yml',
       '.eslintrc.json',
       '.eslintrc',
       'package.json',
  }
}

require'lspconfig'.diagnosticls.setup {
    on_attach = require'completion'.on_attach,
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
        formatters = {
            prettierEslint = prettierEslint,
            prettier = prettier
        }
    }
}
EOF

" Treesitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }
" Telescope
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' >',
    color_devicons = true,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.file_split,
        ["<C-q>"] = actions.send_to_qflist,
      },
    }
  }
}
EOF

nnoremap <C-s> :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <S-s> :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <S-p> :lua require('telescope.builtin').find_files()<CR>


nnoremap <leader>gl :lua require('telescope.builtin').git_commits()<CR>
nnoremap <leader>gb :lua require('telescope.builtin').git_branches()<CR>

" NerdTree settings
let NERDTreeShowHidden=1
let g:NERDTreeGitStatusWithFlags = 1
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
" Git
nnoremap <leader>gs :G<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>
" lightline
if !has('gui_running')
  set t_Co=256
endif

set laststatus=2   
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
