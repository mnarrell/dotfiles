return {
  -- { "github/copilot.vim" },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = { enabled = false },
      suggestion = {
        -- auto_trigger = true,
        auto_trigger = false,
        -- Use alt to interact with Copilot.
        keymap = {
          accept = "<M-y>",
          accept_word = "<M-w>",
          accept_line = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          -- dismiss = "/",
        },
      },
      -- should_attach = function()
      --   return false
      -- end,
    },
    -- config = function()
    --   require("copilot").setup({
    --     -- suggestion = {
    --     --   auto_trigger = true,
    --     -- },
    --   })
    -- end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      -- { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },

  {
    "olimorris/codecompanion.nvim",
    cmd = "CodeCompanion",
    keys = {
      { "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion chat" },
      { "<leader>aa", "<cmd>CodeCompanionChat Add<cr>", desc = "Add to CodeCompanion chat", mode = "x" },
    },
    opts = function()
      local config = require("codecompanion.config").config

      local diff_opts = config.display.diff.opts
      table.insert(diff_opts, "context:99") -- Setting the context to a very large number disables folding.

      return {
        strategies = {
          inline = {
            keymaps = {
              accept_change = {
                modes = { n = "<leader>ay" },
                description = "Accept the suggested change",
              },
              reject_change = {
                modes = { n = "<leader>an" },
                description = "Reject the suggested change",
              },
            },
          },
        },
        display = {
          diff = { opts = diff_opts },
        },
      }
    end,
  },

  {
    "olimorris/codecompanion.nvim",
    cmd = "CodeCompanion",
    keys = {
      { "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion chat" },
      { "<leader>aa", "<cmd>CodeCompanionChat Add<cr>", desc = "Add to CodeCompanion chat", mode = "x" },
    },
    opts = function()
      local config = require("codecompanion.config").config

      local diff_opts = config.display.diff.opts
      table.insert(diff_opts, "context:99") -- Setting the context to a very large number disables folding.

      return {
        strategies = {
          inline = {
            keymaps = {
              accept_change = {
                modes = { n = "<leader>ay" },
                description = "Accept the suggested change",
              },
              reject_change = {
                modes = { n = "<leader>an" },
                description = "Reject the suggested change",
              },
            },
          },
        },
        display = {
          diff = { opts = diff_opts },
        },
      }
    end,
  },
}
