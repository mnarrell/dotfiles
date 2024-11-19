return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    --   { "tt", ":Trouble todo toggle<CR>" },
    { "<LocalLeader>gf", "<Cmd>Trouble lsp_references<CR>" },
    { "<LocalLeader>q", "<Cmd>Trouble qflist open<CR>" },
  },
  opts = {
    win = {
      size = {
        height = 20,
      },
    },
    -- auto_refresh = false,
    auto_preview = false,
    -- follow = false,
    -- restore = false,
  },
}
