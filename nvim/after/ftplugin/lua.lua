local opt = vim.opt_local

opt.list = false
opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
-- opt.equalprg = [[stylua -]]

vim.cmd [[autocmd BufWritePost *.lua lua require("stylua-nvim").format_file()]]
