return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    keys = {
      { "<LocalLeader>gf", "<Cmd>Trouble lsp_references<CR>" },
      { "<LocalLeader>q", "<Cmd>Trouble qflist open<CR>" },
    },
    opts = {
      win = {
        size = {
          height = 20,
        },
      },
      auto_preview = false,
    },
  },
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = LazyFile,
    config = true,
  },
}
