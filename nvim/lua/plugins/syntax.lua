return {
  { "cespare/vim-toml", ft = "toml" },
  { "chr4/nginx.vim", ft = "nginx" },
  { "pearofducks/ansible-vim", ft = "yaml.ansible" },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown", "copilot-chat", "Avante" },
    },
    ft = { "markdown", "copilot-chat", "Avante" },
  },
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
  { "varnishcache-friends/vim-varnish", ft = "vcl" },
}
