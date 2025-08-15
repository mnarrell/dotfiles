return {
  {
    "olimorris/codecompanion.nvim",
    cmd = "CodeCompanion",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "franco-ruggeri/codecompanion-spinner.nvim",
    },
    -- keys = {
    --   { "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion chat" },
    --   { "<leader>aa", "<cmd>CodeCompanionChat Add<cr>", desc = "Add to CodeCompanion chat", mode = "x" },
    -- },
    opts = function()
      local config = require("codecompanion.config").config

      local diff_opts = config.display.diff.opts
      table.insert(diff_opts, "context:99") -- Setting the context to a very large number disables folding.

      return {
        extensions = {
          spinner = {},
        },
        strategies = {
          chat = {
            adapter = "copilot",
          },
        },
        display = {
          diff = { opts = diff_opts },
        },
      }
    end,
  },
}
