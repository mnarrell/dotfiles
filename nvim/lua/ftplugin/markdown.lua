return function()
  vim.bo.equalprg = [[prettier --stdin-filepath '%:p']]
  vim.bo.makeprg = [[open %]]
  vim.bo.textwidth = 0
  vim.bo.wrapmargin = 0
  vim.wo.list = false
  vim.cmd([[setlocal spell]])
  vim.wo.wrap = true

  require('tools').apply_mappings({
    {'n', 'j', 'gj'},
    {'n', 'k', 'gk'},
  }, {buffer = true})
end
