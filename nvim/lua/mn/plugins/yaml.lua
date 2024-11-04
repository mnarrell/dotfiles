return {
  { "pedrohdz/vim-yaml-folds", ft = "yaml" },
  { "towolf/vim-helm", ft = "helm" },
  {
    "cuducos/yaml.nvim",
    ft = { "yaml" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
    },
  },
}
