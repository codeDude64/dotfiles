return {
  "microsoft/vscode-js-debug",
  lazy = true,
  build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
}
