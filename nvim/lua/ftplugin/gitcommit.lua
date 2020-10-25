return function()
  vim.wo.foldenable = false
  vim.cmd([[setlocal spell]])
  vim.wo.list = false
  vim.bo.formatoptions = vim.bo.formatoptions .. 't'
  vim.bo.textwidth = 72
end
