return {
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
    },
  },
}
