local vnoremap = require('tools').vnoremap
local xnoremap = require('tools').xnoremap

vnoremap('.', ':normal .<CR>')
vnoremap('Q', ':normal @q<CR>')
xnoremap('<', '<gv')
xnoremap('>', '>gv')
xnoremap('=', '>gv')
