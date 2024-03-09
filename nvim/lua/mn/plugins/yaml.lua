return {
  { "pedrohdz/vim-yaml-folds", ft = "yaml" },
  { "towolf/vim-helm" },
  {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
    },
  },
}
