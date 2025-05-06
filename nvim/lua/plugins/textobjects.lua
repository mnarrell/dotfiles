return {
  { "christoomey/vim-sort-motion" },
  { "michaeljsmith/vim-indent-object" },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          -- o = ai.gen_spec.treesitter({
          --   a = { "@block.outer", "@conditional.outer", "@loop.outer" },
          --   i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          -- }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          -- d = ai.gen_spec.treesitter({ a = "@comment.outer", i = "@comment.inner" }, {}),
          a = ai.gen_spec.treesitter({ a = "@parameter.outer", i = "@parameter.inner" }, {}),
        },
      }
    end,
    config = function(_, opts)
      require("mini.ai").setup(opts)
    end,
  },
}
