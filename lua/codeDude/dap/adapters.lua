return {
  node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/vscode-node-debug2/out/src/nodeDebug.js' }
  }
}
