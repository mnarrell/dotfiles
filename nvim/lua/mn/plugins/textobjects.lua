return {
  { "christoomey/vim-sort-motion" },
  { "michaeljsmith/vim-indent-object" },
  -- {
  --   "kana/vim-textobj-indent",
  --   dependencies = {
  --     "kana/vim-textobj-user",
  --   },
  -- },

  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter-textobjects" },
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
          a = ai.gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }, {}),
        },
      }
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)
    end,
  },

  -- {
  --   "arsham/indent-tools.nvim",
  --   event = "InsertEnter",
  --   dependencies = { "arsham/arshlib.nvim" },
  --   config = true,
  -- },
  -- {
  --   "chrisgrieser/nvim-various-textobjs",
  --   event = "InsertEnter",
  --   config = function()
  --     require("various-textobjs").setup({ useDefaultKeymaps = true })
  --   end,
  -- },
}
