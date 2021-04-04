local o = vim.o
local nnoremap = require('tools').nnoremap
local nmap = require('tools').nmap

local M = {}


o.list = false
o.expandtab = false
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4

vim.api.nvim_command([[command! -bang A call go#alternate#Switch(<bang>0, 'edit')]])
vim.api.nvim_command([[command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')]])
vim.api.nvim_command([[command! -bang AS call go#alternate#Switch(<bang>0, 'split')]])
vim.api.nvim_command([[command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')]])

nnoremap('<C-g>', ':GoDeclsDir<CR>')

M.build_files = function()
  local f = vim.fn.expand('%')
  if string.endswith(f, '_test.go') then
    -- vim.api.nvim_command('call go#test#Test(0, 1)')
    vim.fn['go#test#Test'](0, 1)
  elseif string.endswith(f, '.go') then
    vim.api.nvim_command('GoBuild -i')
  end
end
nnoremap('gb', [[:lua require('ftplugin.go').build_files()<CR>]])

local buf_local_nmap = function(lhs, rhs)
  nmap(lhs, rhs, {buffer = true})
end

buf_local_nmap('†', '<Plug>(go-test-func)')
buf_local_nmap('db', '<Plug>(go-doc-browser)')
buf_local_nmap('de', '<Plug>(go-def-vertical)')
buf_local_nmap('gc', '<Plug>(go-callers)')
buf_local_nmap('gf', '<Plug>(go-referrers)')
buf_local_nmap('gi', '<Plug>(go-implements)')
buf_local_nmap('gr', '<Plug>(go-rename)')
buf_local_nmap('tc', '<Plug>(go-coverage-toggle)')

return M
