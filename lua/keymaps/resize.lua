return {
  { '<A-l>', function() vim.cmd.resize({ args = { '+5' }, mods = { vertical = true } }) end },
  { '<A-h>', function() vim.cmd.resize({ args = { '-5' }, mods = { vertical = true } }) end },
  { '<A-k>', function() vim.cmd.resize({ args = { '-5' } }) end },
  { '<A-j>', function() vim.cmd.resize({ args = { '+5' } }) end },
}
