return {
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      mappings = {
        comment = "cm",
        comment_line = "cml",
        -- textobject = "c",
      },
      -- options = {
      --   custom_commentstring = function()
      --     return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
      --   end,
      -- },
    },
  },
}
