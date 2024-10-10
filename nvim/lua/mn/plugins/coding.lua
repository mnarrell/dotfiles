return {
  { "folke/todo-comments.nvim", config = true },
  { "folke/lazydev.nvim", ft = "lua" },
  { "cespare/vim-toml", ft = "toml" },
  { "chr4/nginx.vim", ft = "nginx" },
  { "pearofducks/ansible-vim", ft = "yaml.ansible" },
  { "MeanderingProgrammer/markdown.nvim", ft = "markdown", config = true },

  -- {
  --   "zbirenbaum/copilot.lua",
  --   cmd = "Copilot",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = {
  --         auto_trigger = true,
  --       },
  --     })
  --   end,
  -- },

  -- {
  --   "zbirenbaum/copilot-cmp",
  --   event = "InsertEnter",
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  --   dependencies = {
  --     "zbirenbaum/copilot.lua",
  --     cmd = "Copilot",
  --     config = function()
  --       require("copilot").setup({
  --         suggestion = { enabled = false },
  --         panel = { enabled = false },
  --       })
  --     end,
  --   },
  -- },
}
