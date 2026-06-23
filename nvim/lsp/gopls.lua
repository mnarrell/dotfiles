---@brief
---
--- https://github.com/golang/tools/tree/master/gopls
---
--- Google's lsp server for golang.

local settings = {
  -- buildFlags = { "tools" },
  gopls = {
    gofumpt = true,
    codelenses = {
      -- kttps://github.com/golang/tools/blob/master/gopls/doc/settings.md#code-lenses
      gc_details = true, -- Toggle the calculation of gc annotations
      generate = true, -- Runs go generate for a given directory
      regenerate_cgo = true, -- Regenerates cgo definitions
      test = true, -- Runs go test for a specific set of test or benchmark functions
      tidy = true, -- Runs go mod tidy for a module
      upgrade_dependency = true, -- Upgrades a dependency in the go.mod file for a module
      vendor = true, -- Runs go mod vendor for a module
    },
    analyses = {
      -- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
      --   shadow = true,
      nilness = true,
      unusedparams = true,
      unusedwrite = true,
      unreachable = true,
      unusedvariable = true,
    },
    hints = {
      assignVariableTypes = true,
      compositeLiteralFields = true,
      compositeLiteralTypes = true,
      constantValues = true,
      functionTypeParameters = true,
      parameterNames = true,
      rangeVariableTypes = true,
    },
    diagnosticsDelay = "500ms",
    -- semanticTokens = true,
    usePlaceholders = true,
    staticcheck = true,
    completeUnimported = true,
    matcher = "fuzzy",
    symbolMatcher = "fuzzy",
  },
}

---@type vim.lsp.Config
return {
  cmd = { "gopls", "-remote=auto" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = function(fname)
    return vim.fs.root(fname, { "go.work", "go.mod", ".git" })
  end,
  settings = settings,
}
