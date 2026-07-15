local signs = require("icons").signs

-- Tool ownership policy
-- =====================
-- Every editor tool has exactly one owner, so nothing is installed twice or
-- shadowed on PATH. Who owns what:
--
--   Mason     LSP servers (editor-only by nature; some have no Homebrew
--             formula at all), plus the few linters that are only ever run
--             from inside the editor (see `editor_only_linters` below).
--   Homebrew  Anything also useful from a terminal or CI: shellcheck, shfmt,
--             jq, prettier, stylua, yamllint, sqlfluff, and the linters
--             hadolint + markdownlint.
--   asdf      The Go toolchain (gopls, gofumpt, gci, goimports, revive) via
--             `task go:up`. Deliberately absent here: asdf's shims sit ahead
--             of Mason on PATH, so a Mason copy would only be dead weight.
--   uv        ruff, installed to ~/.local/bin; left out for the same reason.

-- Maps each `lsp/<name>.lua` config to the Mason package that provides its
-- server. `false` means the server has a config but is installed by another
-- owner (see the policy above) and must be skipped here. Every file in lsp/
-- must appear as a key, or ensure_installed() will warn about the gap.
local lsp_to_package = {
  ansiblels = "ansible-language-server",
  basedpyright = "basedpyright",
  bashls = "bash-language-server",
  dockerls = "dockerfile-language-server",
  gopls = false, -- owned by vim-go
  helm_ls = "helm-ls",
  jsonls = "json-lsp",
  lua_ls = "lua-language-server",
  ruff = false, -- owned by uv
  ["tofu-ls"] = "tofu-ls",
  yamlls = "yaml-language-server",
}

-- Non-LSP tools Mason should also install. These are linters invoked only by
-- nvim-lint that lack a good Homebrew formula, so Mason is the cleanest source.
-- (hadolint and markdownlint do have formulae and live in the Brewfiles instead
-- -- markdownlint via `markdownlint-cli`, which ships a `markdownlint` binary.)
local editor_only_linters = {
  "checkmake", -- Makefile linter (nvim-lint: make)
  "tflint", -- Terraform linter (nvim-lint: terraform); only a brew tap, no core formula
}

--- Returns the Mason packages to install: every server resolved from lsp/ via
--- `lsp_to_package`, followed by `editor_only_linters`, de-duplicated. Any
--- lsp/*.lua with no entry in the map is skipped with a warning, so adding a
--- server config without registering its package can't silently no-op.
local function ensure_installed()
  local seen = {}
  local packages = {}

  -- Append pkg unless it's falsy (an owned-elsewhere server) or already added.
  local function add(pkg)
    if pkg and not seen[pkg] then
      seen[pkg] = true
      packages[#packages + 1] = pkg
    end
  end

  -- Resolve each server config name to its package; warn on any unmapped file.
  for _, file in ipairs(vim.api.nvim_get_runtime_file("lsp/*.lua", true)) do
    local name = vim.fn.fnamemodify(file, ":t:r")
    local pkg = lsp_to_package[name]
    if pkg == nil then
      vim.schedule(function()
        vim.notify(
          ("[mason] lsp/%s.lua has no package mapping in mason.lua; add one or set it to false"):format(name),
          vim.log.levels.WARN
        )
      end)
    else
      add(pkg)
    end
  end

  for _, pkg in ipairs(editor_only_linters) do
    add(pkg)
  end

  return packages
end

return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
    },
    opts = {
      ui = {
        icons = {
          package_installed = signs.PassCheck,
          package_pending = signs.Running,
          package_uninstalled = signs.GitRemoved,
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    cmd = {
      "MasonToolsInstall",
      "MasonToolsInstallSync",
      "MasonToolsUpdate",
      "MasonToolsUpdateSync",
      "MasonToolsClean",
    },
    opts = {
      ensure_installed = ensure_installed(),
    },
  },
}
