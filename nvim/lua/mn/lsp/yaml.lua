local support = require("mn.lsp.support")

require("lspconfig").yamlls.setup({
  filetypes = { "yaml", "helm" },
  capabilities = support.capabilities(),
  on_attach = function(client, bufnr)
    -- disable and reset diagnostics for helm files (because the LS can't
    -- read them properly)
    if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
      vim.diagnostic.disable(bufnr)
      vim.diagnostic.reset(nil, bufnr)
    end

    support.on_attach(client, bufnr)
  end,
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = {
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = {
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.22.0-standalone-strict/all.json"] = "/*.k8s.yaml",
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/configmap.json"] = "*onfigma*.{yml,yaml}",
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/deployment.json"] = "*eployment*.{yml,yaml}",
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/service.json"] = "*ervic*.{yml,yaml}",
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/ingress.json"] = "*ngres*.{yml,yaml}",
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/secret.json"] = "*ecre*.{yml,yaml}",
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master/statefulset.json"] = "*stateful*.{yml,yaml}",
      },
      format = { enabled = false },
      validate = true,
      completion = true,
      hover = true,
    },
  },
})
