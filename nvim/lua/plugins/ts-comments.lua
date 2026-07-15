-- Injection-aware commenting for mixed-language files. In a `helm` buffer the
-- base language is the Go template (`{{/* %s */}}`) with `yaml` injected into
-- it, so `gc`/`gcc` picks the right style per cursor position: `# %s` on plain
-- YAML lines, `{{/* %s */}}` inside `{{ }}` actions. Builds on Neovim's native
-- commenting; no keymaps of its own.

return {
  "folke/ts-comments.nvim",
  event = LazyFile,
  opts = {
    lang = {
      helm = "{{/* %s */}}",
      gotmpl = "{{/* %s */}}",
    },
  },
}
