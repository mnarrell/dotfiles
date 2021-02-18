local opt = require('options').opt

return function ()
  opt.autoindent = true
  -- opt.equalprg='yapf'
  opt.equalprg='black --quiet -'
  opt.expandtab = true
  opt.fileformat='unix'
  opt.shiftwidth=4
  opt.softtabstop=4
  opt.tabstop=4
  opt.textwidth=88

  vim.api.nvim_command('highlight! SpellCap ctermbg=NONE')
end
