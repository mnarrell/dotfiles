local tools = require('tools')

local function build_files()
  local f = vim.fn.expand('%')
  if string.endswith(f, '_test.go') then
    vim.api.nvim_command('call go#test#Test(0, 1)')
  elseif string.endswith(f, '.go') then
    vim.api.nvim_command('GoBuild -i')
  end
end

return function()
  vim.wo.list = false
  vim.bo.expandtab = false
  vim.bo.tabstop = 4
  vim.bo.shiftwidth = 4
  vim.bo.softtabstop = 4

  vim.api.nvim_command([[command! -bang A call go#alternate#Switch(<bang>0, 'edit')]])
  vim.api.nvim_command([[command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')]])
  vim.api.nvim_command([[command! -bang AS call go#alternate#Switch(<bang>0, 'split')]])
  vim.api.nvim_command([[command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')]])

  tools.apply_mappings({
    {'n', '<C-g>', ':GoDeclsDir<CR>'},
    {'n', '†', '<Plug>(go-test-func)'}, -- Option T
    {'n', 'db', '<Plug>(go-doc-browser)'},
    {'n', 'de', '<Plug>(go-def-vertical)'},
    {'n', 'gb', build_files},
    {'n', 'gc', '<Plug>(go-callers)'},
    {'n', 'gf', '<Plug>(go-referrers)'},
    {'n', 'gi', '<Plug>(go-implements)'},
    {'n', 'gr', '<Plug>(go-rename)'},
    {'n', 'tc', '<Plug>(go-coverage-toggle)'},
  }, {buffer = true})
end
