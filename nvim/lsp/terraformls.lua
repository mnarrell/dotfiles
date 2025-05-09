---@brief
---
--- https://github.com/hashicorp/terraform-ls
---
--- Terraform language server
--- Download a released binary from https://github.com/hashicorp/terraform-ls/releases.
---
--- From https://github.com/hashicorp/terraform-ls#terraform-ls-vs-terraform-lsp:
---
--- Note, that the `settings` configuration option uses the `workspace/didChangeConfiguration` event,
--- [which is not supported by terraform-ls](https://github.com/hashicorp/terraform-ls/blob/main/docs/features.md).
--- Instead you should use `init_options` which passes the settings as part of the LSP initialize call
--- [as is required by terraform-ls](https://github.com/hashicorp/terraform-ls/blob/main/docs/SETTINGS.md#how-to-pass-settings).

---@type vim.lsp.Config
return {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "terraform-vars" },
  root_markers = { ".terraform", ".git" },
}
