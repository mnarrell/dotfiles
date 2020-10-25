return function()
  vim.bo.equalprg=[[xmllint --format --recover - 2>/dev/null]]
  vim.wo.foldlevel=20
  vim.wo.foldmethod='indent'

  vim.api.nvim_command('wincmd J')

end
