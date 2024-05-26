return {
  "zbirenbaum/copilot-cmp",
  event = { "InsertEnter", "LspAttach" },
  fix_pairs = true,
  config = function()
    require("copilot_cmp").setup()
  end
}
