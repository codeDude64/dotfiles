return {
  node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/.debbugers/vscode-node-debug2/out/src/nodeDebug.js' }
  },
  chrome = {
    type = "executable",
    command = "node",
    args = { os.getenv("HOME") .. "/.debbugers/vscode-chrome-debug/out/src/chromeDebug.js" }
  },
  nlua = function(callback, config)
    callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
  end
}
