function Reload_config()
  print('Reloading config')
  require'plenary.reload'.reload_module('chavati')
end

function Print_table(table)
  print(vim.inspect(table))
end
