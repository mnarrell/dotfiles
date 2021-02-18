local opt = require('options').opt

return function()
  opt.equalprg = [[prettier --stdin-filepath '%:p']]
  opt.makeprg = [[open %]]
  opt.textwidth = 0
  opt.wrapmargin = 0
  opt.list = false
  vim.cmd([[setlocal spell]])
  -- opt.spell = true
  opt.wrap = true

  require('tools').apply_mappings({
    {'n', 'j', 'gj'},
    {'n', 'k', 'gk'},
  }, {buffer = true})
end
