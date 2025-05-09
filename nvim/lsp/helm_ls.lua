---@brief
---
--- https://github.com/mrjosh/helm-ls
---
--- `helm Language server` can be installed by following the instructions [here](https://github.com/mrjosh/helm-ls).

---@type vim.lsp.Config
return {
  cmd = { "helm_ls", "serve" },
  filetypes = { "helm" },
  root_markers = { "Chart.yaml" },
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
}
