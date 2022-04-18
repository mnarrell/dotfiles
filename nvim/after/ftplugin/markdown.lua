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

-- Mappings.
local function buf_nnoremap(lhs, rhs, opts)
	local options = vim.tbl_extend("force", {
		noremap = true,
		silent = true,
		buffer = true,
	}, opts or {})
	vim.keymap.set("n", lhs, rhs, options)
end

buf_nnoremap("j", "gj")
buf_nnoremap("k", "gk")

vim.cmd [[setlocal spell]]
-- opt.spell = true
