local vim = vim

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') ..
                         '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git', 'clone', '--depth', '1',
      'https://github.com/wbthomason/packer.nvim', install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()
local packer = require 'packer'

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Style
  use 'marko-cerovac/material.nvim'
  use {'glepnir/galaxyline.nvim', branch = 'main'}
  -- LSP Plugins
  use 'neovim/nvim-lspconfig'
  use 'tjdevries/nlua.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-cmdline'
  use 'onsails/lspkind-nvim'
  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/playground'
  use 'nvim-treesitter/completion-treesitter'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'cljoly/telescope-repo.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'nvim-telescope/telescope-node-modules.nvim'
  -- Tree
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  -- Git
  use 'TimUntersberger/neogit'
  use 'sindrets/diffview.nvim'
  use 'lewis6991/gitsigns.nvim'

  -- Surround
  use 'kylechui/nvim-surround'
  -- Auto Pairs
  use 'windwp/nvim-autopairs'
  -- Tmux navigator
  use 'christoomey/vim-tmux-navigator'
  -- Latex
  use 'lervag/vimtex'
  -- Bufferline
  use 'akinsho/nvim-bufferline.lua'
  -- Harpoon
  use 'ThePrimeagen/harpoon'
  -- Debugger
  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'

  if packer_bootstrap then require('packer').sync() end
end)
