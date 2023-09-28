return {
  "zbirenbaum/copilot-cmp",
  event = { "InsertEnter", "LspAttach" },
  config = function()
    require("copilot_cmp").setup()
  end
}
