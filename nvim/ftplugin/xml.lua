-- local opt = require('options').opt
local opt = vim.opt_local

opt.equalprg=[[xmllint --format --recover - 2>/dev/null]]
opt.foldlevel=20
opt.foldmethod='indent'

vim.api.nvim_command('wincmd J')
