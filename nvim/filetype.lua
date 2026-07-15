vim.filetype.add({
  extension = {
    -- Neovim does not detect OpenTofu-native files; map them to terraform.
    tofu = "terraform",
  },
  filename = {
    ["staticcheck.conf"] = "toml",
    [".envrc"] = "direnv",
    ["main.yaml"] = "yaml.ansible",
    -- Chart metadata is plain YAML (schema-validated by yaml-language-server),
    -- never a Go template, so keep it off the `helm` filetype.
    ["Chart.yaml"] = "yaml",
    ["Chart.lock"] = "yaml",
  },
  pattern = {
    ["*.tf"] = "terraform",
    [".*/%.kube/config"] = "yaml",
    [".*/git/config.*"] = "gitconfig",
    [".*/playbooks/.*%.yaml"] = "yaml.ansible",
    -- Helm charts: everything under templates/ is a Go template. Both the YAML
    -- manifests (deployment.yaml) and the mustache-like partials (_helpers.tpl)
    -- use the `helm` filetype so the tree-sitter `helm` parser injects YAML into
    -- `{{ }}` and helm-ls attaches uniformly. NOTES.txt is a template too.
    [".*/templates/.*%.ya?ml"] = "helm",
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/NOTES%.txt"] = "helm",
    -- values*.yaml is plain YAML, but the compound filetype lets helm-ls attach
    -- (for value completion/hover) while the `yaml` root still drives the yaml
    -- tree-sitter parser and ftplugin.
    ["values.*%.ya?ml"] = "yaml.helm-values",
    ["Brewfile.*"] = "ruby",
  },
})
