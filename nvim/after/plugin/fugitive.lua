local nnoremap = require("mn.lib").nnoremap

nnoremap("<Leader>gb", ":Git blame<CR>")
nnoremap("<Leader>gd", ":Gvdiff<CR>")
nnoremap("<Leader>gr", ":Gread<CR> :w <CR>")
nnoremap("<Leader>gs", ":Git<CR>")

nnoremap("<LocalLeader>gd", ":diffget //2 <CR>")
nnoremap("<LocalLeader>gl", ":diffget //3 <CR>")
