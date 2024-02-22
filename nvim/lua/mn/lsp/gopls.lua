local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  vim.notify("Unable to load lspconfig", vim.log.levels.ERROR)
  return
end

local support = require("mn.lsp.support")

local on_attach = function(client, bufnr)
  require("mn.lsp.support").on_attach(client, bufnr)
end

lspconfig.gopls.setup({
  on_attach = on_attach,
  capabilities = support.capabilities(),
  flags = {
    debounce_text_changes = 500,
  },
  settings = {
    -- buildFlags = { "tools" },
    gopls = {
      -- codelenses = {
      --   -- kttps://github.com/golang/tools/blob/master/gopls/doc/settings.md#code-lenses
      --   gc_details = true, -- Toggle the calculation of gc annotations
      --   generate = true, -- Runs go generate for a given directory
      --   regenerate_cgo = true, -- Regenerates cgo definitions
      --   test = true, -- Runs go test for a specific set of test or benchmark functions
      --   tidy = true, -- Runs go mod tidy for a module
      --   upgrade_dependency = true, -- Upgrades a dependency in the go.mod file for a module
      --   vendor = true, -- Runs go mod vendor for a module
      -- },
      -- semanticTokens = true,
      -- usePlaceholders = true,
      analyses = {
        -- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
        --   nilness = true,
        --   shadow = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
        unusedvariable = true,
      },
      staticcheck = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      -- diagnosticsDelay = "500ms",
    },
  },
})
