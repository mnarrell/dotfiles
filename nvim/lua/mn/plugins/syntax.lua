return {
  { "cespare/vim-toml", ft = "toml" },
  { "chr4/nginx.vim", ft = "nginx" },
  { "pearofducks/ansible-vim", ft = "yaml.ansible" },
  { "MeanderingProgrammer/markdown.nvim", ft = "markdown", config = true },
  { "pedrohdz/vim-yaml-folds", ft = "yaml" },
  { "towolf/vim-helm", ft = "helm" },
  {
    "hashivim/vim-terraform",
    ft = { "terraform", "hcl" },
    init = function()
      vim.g.terraform_align = 1
      vim.g.terraform_fmt_on_save = 1
    end,
  },

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
