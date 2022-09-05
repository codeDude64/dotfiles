RELOAD = function(...) require'plenary.reload'.reload_module(...) end

R = function(name)
  print('Reloading config...')
  RELOAD(name)
  print('Done :)')
  return require(name)
end

RCONFIG = function() R('codeDude') end

P = function(table) print(vim.inspect(table)) end
