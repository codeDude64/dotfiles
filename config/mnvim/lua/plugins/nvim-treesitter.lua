vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' }
})

local tresitter = require 'nvim-treesitter'

local languages = {
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


tresitter.install(languages)

vim.api.nvim_create_autocmd('FileType', {
  pattern = languages,
  callback = function() vim.treesitter.start() end,
})
