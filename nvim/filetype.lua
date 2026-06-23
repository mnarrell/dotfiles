vim.filetype.add({
  extension = {
    -- Neovim does not detect OpenTofu-native files; map them to terraform.
    tofu = "terraform",
  },
  filename = {
    ["staticcheck.conf"] = "toml",
    [".envrc"] = "direnv",
    ["main.yaml"] = "yaml.ansible",
  },
  pattern = {
    [".*/%.kube/config"] = "yaml",
    [".*/git/config.*"] = "gitconfig",
    [".*/playbooks/.*%.yaml"] = "yaml.ansible",
    [".*/templates/.*%.yaml"] = "helm",
    ["Brewfile.*"] = "ruby",
  },
})
