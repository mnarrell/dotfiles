local tnoremap = require('tools').tnoremap

tnoremap('<Esc>', [[<C-\><C-n>]])
tnoremap('<Leader>q', [[<C-\><C-n> :bd!<CR>]])
