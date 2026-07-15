# Helm chart support

A ground-up Neovim setup for authoring [Helm](https://helm.sh/) charts: LSP,
tree-sitter highlighting, folding, and context-aware commenting for both the
YAML-based templates (`deployment.yaml`) and the mustache-like partials
(`_helpers.tpl`).

The design target is a real chart layout such as
[`bitnami/postgresql`](https://github.com/bitnami/charts/tree/main/bitnami/postgresql):

```
postgresql/
├── Chart.yaml              # yaml         (schema-validated)
├── Chart.lock              # yaml
├── values.yaml             # yaml.helm-values
├── values.schema.json      # json
└── templates/
    ├── _helpers.tpl        # helm
    ├── NOTES.txt           # helm
    ├── statefulset.yaml    # helm
    └── primary/
        └── svc-headless.yaml  # helm
```

## How it fits together

| Concern        | Mechanism                                                                 |
| -------------- | ------------------------------------------------------------------------- |
| Filetype       | `filetype.lua` patterns (no `ftdetect/`)                                   |
| LSP            | `helm-ls` (native `vim.lsp.config`), with `yaml-language-server` fallback  |
| Highlighting   | tree-sitter `helm` / `gotmpl` / `yaml` parsers (no vim regex syntax)       |
| Folding        | tree-sitter `foldexpr`                                                     |
| Commenting     | `folke/ts-comments.nvim` (injection-aware `gc`/`gcc`)                      |
| Extra editing  | `qvalentin/helm-ls.nvim` (`%` jump, block highlight, value hints)          |
| Formatting     | none — Helm templates are intentionally left unformatted                   |

## Filetype detection

`nvim/filetype.lua` maps chart files to filetypes:

| Path / name                       | Filetype           | Why                                                            |
| --------------------------------- | ------------------ | ------------------------------------------------------------- |
| `**/templates/**.ya?ml`           | `helm`             | Go template producing YAML                                    |
| `**/templates/**.tpl`             | `helm`             | Named-template partials (e.g. `_helpers.tpl`)                 |
| `**/templates/NOTES.txt`          | `helm`             | Rendered post-install notes template                          |
| `values*.yaml`                    | `yaml.helm-values` | Plain YAML, but lets `helm-ls` attach for value completion    |
| `Chart.yaml`, `Chart.lock`        | `yaml`             | Never a template; schema-validated by `yaml-language-server`  |

`_helpers.tpl` uses the `helm` filetype (not `gotmpl`) so the tree-sitter `helm`
parser still injects YAML into the bodies of `{{ define }}` blocks and `helm-ls`
attaches uniformly across the chart.

`values*.yaml` uses the compound filetype `yaml.helm-values`: the `yaml` root
drives the ftplugin and tree-sitter parser, while the `.helm-values` suffix lets
`helm-ls` attach (its `filetypes` list includes `yaml.helm-values`) without
attaching to every YAML file in every repo.

## LSP — helm-ls

`nvim/lsp/helm_ls.lua` configures [`helm-ls`](https://github.com/mrjosh/helm-ls):

- **Filetypes:** `helm`, `yaml.helm-values`
- **Root marker:** `Chart.yaml`
- **Features:** completion / hover / go-to-definition for `.Values.*`, built-in
  objects (`.Chart`, `.Release`, `.Files`, …), `include`, and gotemplate + Sprig
  functions; diagnostics from `helm lint`.

`helm-ls` **spawns its own `yaml-language-server`** internally: it converts
templates to YAML for schema validation and generates JSON schemas for
`values*.yaml`. Because of this, no second `yamlls` client is attached to `helm`
buffers. The standalone `yamlls` config still handles plain `yaml` (Chart.yaml,
raw Kubernetes manifests).

> `helm-ls` requires `yaml-language-server` on `PATH`. Both binaries are owned by
> Mason (`helm-ls`, `yaml-language-server` in `lua/plugins/mason.lua`).

### Dependency charts

For completion/hover against subchart values, download dependencies first:

```bash
helm dependency build
```

## Highlighting — tree-sitter

Highlighting is pure tree-sitter (the previous `syntax/helm.vim` regex file was
removed). Parsers: `helm`, `gotmpl`, `yaml`, `go`, `json`
(`nvim/lua/plugins/treesitter.lua`).

The `helm` parser (from
[`ngalaiko/tree-sitter-go-template`](https://github.com/ngalaiko/tree-sitter-go-template))
parses the Go template layer and **injects `yaml`** as a combined tree spanning
the whole buffer. The result is full Kubernetes-YAML highlighting *and*
gotemplate/Sprig highlighting in the same file — including YAML fragments inside
`{{ define }}` blocks in `_helpers.tpl`.

Because `yaml.helm-values` is a compound filetype, it is registered back to the
`yaml` parser so tree-sitter starts on values files:

```lua
vim.treesitter.language.register("yaml", "yaml.helm-values")
```

## Folding

Folding uses the tree-sitter `foldexpr`, which folds **both** YAML blocks and
template blocks (`if` / `range` / `with` / `define`). Set per-buffer in
`nvim/after/ftplugin/helm.lua`, with everything unfolded on open
(`foldlevelstart = 99`).

`helm-ls` (via its embedded `yaml-language-server`) may advertise
`textDocument/foldingRange`, but those ranges only cover the YAML surface and
miss template blocks. `nvim/lua/lsp.lua` therefore **skips** switching `helm`
buffers to `vim.lsp.foldexpr()`, so tree-sitter folding always wins.

## Commenting

`folke/ts-comments.nvim` makes the native `gc` / `gcc` commenting
injection-aware (`nvim/lua/plugins/ts-comments.lua`).

- **Helm templates** → `{{/* %s */}}` on every line. Because YAML is a *combined*
  injection spanning the whole buffer, the resolved language for any position is
  `helm`. This is the safe choice: `{{/* */}}` stops the template engine from
  executing a commented line, whereas a YAML `#` does **not** (Helm still renders
  `{{ }}` on a `#`-commented line).
- **`values.yaml` / plain YAML** → `# %s`.

The `helm` ftplugin also sets `commentstring = "{{/* %s */}}"` as a fallback for
when tree-sitter is unavailable.

## Extra editing — helm-ls.nvim

[`qvalentin/helm-ls.nvim`](https://github.com/qvalentin/helm-ls.nvim)
(`nvim/lua/plugins/helm-ls.lua`, lazy-loaded on `ft = "helm"`) adds Helm-specific
editor features on top of the LSP:

- `%` jumps between the start and end of a template block (`if` / `with` /
  `range`);
- highlights the template block under the cursor;
- conceals templates with virtual text of their **current values**
  (`conceallevel = 2` is set in the ftplugin for correct wrapped-line handling);
- shows hints for the effect of `indent` / `nindent`.

## Formatting & linting

Helm templates are **not** formatted — running `prettier`/`yamlfmt` over `{{ }}`
corrupts the template syntax, so there is no `helm` entry in `conform.nvim`.
Diagnostics come from `helm-ls` (`helm lint` plus its embedded
`yaml-language-server`).

## File map

| File                                    | Role                                             |
| --------------------------------------- | ------------------------------------------------ |
| `nvim/filetype.lua`                     | `helm` / `yaml.helm-values` / `yaml` detection   |
| `nvim/lsp/helm_ls.lua`                  | `helm-ls` server config + settings               |
| `nvim/lsp/yamlls.lua`                   | `yaml-language-server` for plain `yaml`          |
| `nvim/lua/plugins/treesitter.lua`       | parsers + `yaml.helm-values` → `yaml` register   |
| `nvim/after/ftplugin/helm.lua`          | indent, folding, commentstring, conceallevel     |
| `nvim/lua/lsp.lua`                      | folding guard for `helm` buffers                 |
| `nvim/lua/plugins/ts-comments.lua`      | injection-aware commenting                       |
| `nvim/lua/plugins/helm-ls.lua`          | `helm-ls.nvim` editor features                   |

## Dependencies

Installed by Mason (`:MasonToolsInstall`): `helm-ls`, `yaml-language-server`.
Plugins are pinned in `nvim/lazy-lock.json`: `helm-ls.nvim`, `ts-comments.nvim`.
The `helm` CLI must be on `PATH` for `helm lint` diagnostics and
`helm dependency build`.
