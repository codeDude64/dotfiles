vim.pack.add({
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' }
})

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(event)
    local name, kind = event.data.spec.name, event.data.kind
    if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
      if not event.data.active then
        vim.cmd('packadd nvim-treesitter')
      end
      vim.cmd('TSUpdate')
    end
  end
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
