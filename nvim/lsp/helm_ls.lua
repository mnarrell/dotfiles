---@brief
---
--- https://github.com/mrjosh/helm-ls
---
--- `helm Language server` can be installed by following the instructions [here](https://github.com/mrjosh/helm-ls).
---
--- helm-ls drives the whole Helm experience:
---   * template files (`helm` ft) - completion/hover/go-to-def for `.Values.*`,
---     built-in objects, `include`, gotemplate + Sprig functions;
---   * values files (`yaml.helm-values` ft) - completion/hover from generated
---     JSON schemas and sibling values files.
---
--- It also spawns its own yaml-language-server internally (converting templates
--- to YAML and generating value schemas), so a second yamlls client is neither
--- needed nor wanted on these buffers. Plain `yaml` (Chart.yaml, k8s manifests)
--- is still handled by the standalone `yamlls` config.

---@type vim.lsp.Config
return {
  cmd = { "helm_ls", "serve" },
  filetypes = { "helm", "yaml.helm-values" },
  root_markers = { "Chart.yaml" },
  settings = {
    ["helm-ls"] = {
      logLevel = "info",
      valuesFiles = {
        mainValuesFile = "values.yaml",
        lintOverlayValuesFile = "values.lint.yaml",
        additionalValuesFilesGlobPattern = "values*.yaml",
      },
      helmLint = {
        enabled = true,
        ignoredMessages = {},
      },
      yamlls = {
        enabled = true,
        enabledForFilesGlob = "*.{yaml,yml}",
        diagnosticsLimit = 50,
        showDiagnosticsDirectly = false,
        -- helm-ls shells out to this for its internal YAML processing; it must
        -- be on PATH (installed via Mason, same package as the `yamlls` config).
        path = "yaml-language-server",
        initTimeoutSeconds = 5,
        config = {
          schemas = {
            kubernetes = "templates/**",
          },
          completion = true,
          hover = true,
        },
      },
    },
  },
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
}
