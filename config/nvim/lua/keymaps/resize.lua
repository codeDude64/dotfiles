return {
  { 'n', '<A-l>', function() vim.cmd.resize({ args = { '+5' }, mods = { vertical = true } }) end },
  { 'n', '<A-h>', function() vim.cmd.resize({ args = { '-5' }, mods = { vertical = true } }) end },
  { 'n', '<A-k>', function() vim.cmd.resize({ args = { '-5' } }) end },
  { 'n', '<A-j>', function() vim.cmd.resize({ args = { '+5' } }) end },
}
