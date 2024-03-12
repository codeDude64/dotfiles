return {
  { "<leader>ccb", ":CopilotChatBuffer ",         desc = "CopilotChat - Chat with current buffer" },
  { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
  { "<leader>cct", "<cmd>CopilotChatTests<cr>",   desc = "CopilotChat - Generate tests" },
  {
    "<leader>ccT",
    "<cmd>CopilotChatVsplitToggle<cr>",
    desc = "CopilotChat - Toggle Vsplit",
  },
  {
    "<leader>ccv",
    ":CopilotChatVisual ",
    mode = "x",
    desc = "CopilotChat - Open in vertical split",
  },
  {
    "<leader>ccx",
    ":CopilotChatInPlace<cr>",
    mode = "x",
    desc = "CopilotChat - Run in-place code",
  },
  {
    "<leader>ccf",
    "<cmd>CopilotChatFixDiagnostic<cr>",
    desc = "CopilotChat - Fix diagnostic",
  },
  {
    "<leader>ccr",
    "<cmd>CopilotChatReset<cr>",
    desc = "CopilotChat - Reset chat history and clear buffer",
  }
}
