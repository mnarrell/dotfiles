local nnoremap = require('tools').nnoremap
-- local opt = require('options').opt
-- local opt = vim.opt_local
local opt = vim.o

opt.equalprg = [[prettier --stdin-filepath '%:p']]
opt.makeprg = [[open %]]
opt.formatprg = 'par -w120rq'
opt.textwidth = 0
opt.wrapmargin = 0
opt.list = false
-- vim.cmd([[setlocal spell]])
opt.spell = true
opt.wrap = true

nnoremap('j', 'gj', {buffer = true})
nnoremap('k', 'gk', {buffer = true})
