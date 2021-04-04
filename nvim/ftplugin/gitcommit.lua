local o = vim.o

o.foldenable = false
o.list = false
-- o.formatoptions = vim.bo.formatoptions .. 't'
o.formatoptions:append('t')
o.textwidth = 72

o.spell = true
-- vim.cmd([[setlocal spell]])
