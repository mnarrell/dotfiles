local opt = vim.opt_local

opt.foldenable = false
opt.list = false
-- o.formatoptions = vim.bo.formatoptions .. 't'
opt.formatoptions:append "t"
opt.textwidth = 72

-- opt.spell = true
vim.cmd [[setlocal spell]]
