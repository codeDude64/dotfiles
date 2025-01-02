return {
  javascriptTypescript = {
    'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost'
  },
  nlua = function(callback, config)
    callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
  end,
  gbd = {
    type = 'executable',
    command = 'gbd',
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
  }
}
