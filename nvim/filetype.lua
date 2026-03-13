vim.filetype.add({
  filename = {
    ["staticcheck.conf"] = "toml",
    [".envrc"] = "direnv",
    ["main.yaml"] = "yaml.ansible",
  },
  pattern = {
    ["*.tf"] = "terrraform",
    [".*/%.kube/config"] = "yaml",
    [".*/git/config.*"] = "gitconfig",
    [".*/playbooks/.*%.yaml"] = "yaml.ansible",
    [".*/templates/.*%.yaml"] = "helm",
    ["Brewfile.*"] = "ruby",
  },
})
