vim.pack.add({
  { src = 'https://github.com/lervag/vimtex' }
}, { load = false })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'tex',
  callback = function()
    vim.cmd('packadd vimtex')
  end
})

vim.g.vimtex_view_method = "zathura"
