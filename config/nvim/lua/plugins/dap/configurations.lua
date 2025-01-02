return {
  javascriptTypescript = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "attach",
      name = "Attach",
      processId = require 'dap.utils'.pick_process,
      cwd = "${workspaceFolder}",
    },
    {
      type = "pwa-node",
      request = "launch",
      name = "Debug Jest Tests",
      runtimeExecutable = "node",
      runtimeArgs = {
        "./node_modules/jest/bin/jest.js",
        "--runInBand",
      },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
    {
      type = "pwa-chrome",
      request = "launch",
      name = "Launch Chrome",
      url = "http://localhost",
      webRoot = "${workspaceFolder}",
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      runtimeExecutable = "google-chrome-stable",
    },
    {
      type = "pwa-chrome",
      request = "attach",
      name = "Attach to Chrome",
      cwd = "${workspaceFolder}",
      port = 9222,
      webRoot = "${workspaceFolder}",
      url = "http://localhost",
    },
  },
  nlua = {
    {
      type = 'nlua',
      request = 'attach',
      name = "Attach to running Neovim instance",
    }
  },
  c = {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  },
}
