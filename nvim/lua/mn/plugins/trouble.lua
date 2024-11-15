return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    win = {
      size = {
        height = 20,
      },
    },
    -- auto_refresh = false,
    -- auto_preview = false,
    -- follow = false,
    -- restore = false,
  },
  keys = {
    --   { "tt", ":Trouble todo toggle<CR>" },
    --   -- { "<leader><leader>lc", "<Cmd>TroubleClose<CR>" },
    --   -- { "<leader><leader>li", "<Cmd>TroubleToggle document_diagnostics<CR>" },
    --   -- { "<leader><leader>lw", "<Cmd>TroubleToggle workspace_diagnostics<CR>" },
    { "<LocalLeader>gf", "<Cmd>Trouble lsp_references<CR>" },
    { "<LocalLeader>q", "<Cmd>Trouble quickfix<CR>" },
  },
}
