local opt = vim.opt_local

opt.equalprg = [[xmllint --format --recover - 2>/dev/null]]
opt.foldlevel = 20
opt.foldmethod = "indent"

vim.cmd "wincmd J"
