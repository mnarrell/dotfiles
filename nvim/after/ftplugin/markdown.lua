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

local map = function(lhs, rhs)
  vim.keymap.set("n", lhs, rhs, { buffer = true, silent = true })
end

map("j", "gj")
map("k", "gk")

-- vim.cmd [[setlocal spell]]
opt.spell = true
