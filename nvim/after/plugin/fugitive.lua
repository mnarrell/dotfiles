local nnoremap = require("mn.mappings").nnoremap

nnoremap("<Leader>gb", ":Git blame<CR>")
nnoremap("<Leader>gd", ":Gvdiff<CR>")
nnoremap("<Leader>gr", ":Gread<CR> :w <CR>")
nnoremap("<Leader>gs", ":Git<CR>")
