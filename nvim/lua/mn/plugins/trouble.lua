return {
  "folke/trouble.nvim",
  opts = {
    height = 20,
  },
  keys = {
    { "tt", ":TroubleToggle<CR>" },
    { "<leader><leader>lc", "<Cmd>TroubleClose<CR>" },
    { "<leader><leader>li", "<Cmd>TroubleToggle document_diagnostics<CR>" },
    { "<leader><leader>lw", "<Cmd>TroubleToggle workspace_diagnostics<CR>" },
    { "<leader><leader>lr", "<Cmd>TroubleToggle lsp_references<CR>" },
    { "<leader><leader>lq", "<Cmd>TroubleToggle quickfix<CR>" },
    { "<leader><leader>ll", "<Cmd>TroubleToggle loclist<CR>" },
  },
}
