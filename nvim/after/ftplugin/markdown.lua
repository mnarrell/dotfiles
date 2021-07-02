if not pcall(require, "mn.mappings") then
	return
end

local nnoremap = require("mn.mappings").nnoremap
local opt = vim.opt_local

opt.equalprg = [[prettier --stdin-filepath '%:p']]
opt.makeprg = [[open %]]
opt.formatprg = "par -w120rq"
-- opt.formatprg = "par -w78rs"
opt.textwidth = 0
opt.wrapmargin = 0
opt.list = false
opt.wrap = true

vim.cmd [[setlocal spell]]
-- opt.spell = true

nnoremap("j", "gj", { buffer = true })
nnoremap("k", "gk", { buffer = true })
