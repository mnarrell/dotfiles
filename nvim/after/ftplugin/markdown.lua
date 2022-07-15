-- Options
local opt = vim.opt_local

opt.equalprg = [[prettier --stdin-filepath '%:p']]
opt.makeprg = [[open %]]
opt.formatprg = "par -w120rq"
-- opt.formatprg = "par -w78rs"
opt.textwidth = 0
opt.wrapmargin = 0
opt.list = false
opt.wrap = true

local buf_nnoremap = require("mn.lib").buf_nnoremap
buf_nnoremap("j", "gj")
buf_nnoremap("k", "gk")

vim.cmd [[setlocal spell]]
-- opt.spell = true
