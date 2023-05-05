return {
  "zbirenbaum/copilot-cmp",
  event = { "InsertEnter", "LspAttach" },
  branch = "formatting-fixes",
  config = function()
    require("copilot_cmp").setup()
  end
}
