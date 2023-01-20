local cmd = vim.api.nvim_create_augroup("hcl", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  command = [[ silent !terragrunt hclfmt --terragrunt-hclfmt-file % ]],
  pattern = "*.hcl",
  group = cmd,
})
