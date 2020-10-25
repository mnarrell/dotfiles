return function ()
  vim.bo.autoindent = true
  vim.bo.equalprg='yapf'
  vim.bo.expandtab = true
  vim.bo.fileformat='unix'
  vim.bo.shiftwidth=4
  vim.bo.softtabstop=4
  vim.bo.tabstop=4
  vim.bo.textwidth=79

  vim.api.nvim_command('highlight! SpellCap ctermbg=NONE')
end
