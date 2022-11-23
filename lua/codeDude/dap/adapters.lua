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
  }
}
