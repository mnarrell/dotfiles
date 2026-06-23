-- Install with: npm i -g add yaml-language-server

---@type vim.lsp.Config
return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml" },
  -- settings = {
  --   yaml = {
  --     -- Using the schemastore plugin for schemas.
  --     schemastore = { enable = false, url = "" },
  --     schemas = require("schemastore").yaml.schemas(),
  --   },
  -- },
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = {
      schemaStore = {
        enable = false,
        -- enable = true,
        -- url = "https://www.schemastore.org/api/json/catalog.json",
      },
      schemas = require("schemastore").yaml.schemas(),
      format = { enabled = false },
      validate = true,
      completion = true,
      hover = true,
    },
  },
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  },
}
