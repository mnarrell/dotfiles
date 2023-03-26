vim.filetype.add({
  filename = {
    ["staticcheck.conf"] = "toml",
    [".envrc"] = "direnv",
    [".tfrc"] = "hcl",
    ["main.yaml"] = "yaml.ansible",
  },
  pattern = {
    ["Brewfile.*"] = "ruby",
    [".*/git/config.*"] = "gitconfig",
    [".*/%.kube/config"] = "yaml",
    [".*/templates/.*%.yaml"] = "helm",
    -- [".*/playbooks/.*%.yaml"] = "yaml.ansible"
  },
})
