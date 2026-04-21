return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = "BufReadPre",
  branch = "main",
  dependencies = {
    -- 'nvim-treesitter/playground',
    -- 'nvim-treesitter/completion-treesitter',
    -- 'nvim-treesitter/nvim-treesitter-textobjects'
  },
  config = function()
    local tresitter = require 'nvim-treesitter'

    tresitter.install {
      'javascript',
      'typescript',
      'html',
      'css',
      'ruby',
      'cpp',
      'c',
      'cmake',
      'lua',
      'php',
      'bash',
      'python',
      'yaml',
      'latex',
      'markdown',
    }

  end
}
