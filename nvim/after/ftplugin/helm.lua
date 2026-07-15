local opt = vim.opt_local

-- Kubernetes/Helm manifests are 2-space YAML.
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.cursorcolumn = true

-- Fallback commentstring for when tree-sitter is unavailable. ts-comments.nvim
-- makes `gc`/`gcc` injection-aware: `#` on plain YAML lines, `{{/* %s */}}`
-- inside `{{ }}` template actions.
opt.commentstring = "{{/* %s */}}"

-- helm-ls.nvim renders template values as virtual text; conceallevel 2 keeps
-- wrapped lines aligned when that replacement is active.
opt.conceallevel = 2

-- Tree-sitter folding: the `helm` parser folds both YAML blocks and template
-- actions (if/range/with/define). Assert it explicitly here because helm-ls may
-- advertise foldingRange (lsp.lua deliberately skips switching the foldexpr for
-- helm buffers so this wins). Everything starts unfolded.
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
