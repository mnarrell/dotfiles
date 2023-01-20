vim.filetype.add({
  filename = {
    ["staticcheck.conf"] = "toml",
    [".envrc"] = "direnv",
  },
  pattern = {
    ["Brewfile.*"] = "ruby",
    [".*/git/config.*"] = "gitconfig",
    [".*/%.kube/config"] = "yaml",
    [".*/templates/.*%.yaml"] = "helm",
  },
})
