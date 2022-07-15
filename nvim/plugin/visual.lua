local vnoremap = require("mn.lib").vnoremap
vnoremap(".", ":normal .<CR>")
vnoremap("Q", ":normal @q<CR>")

local xnoremap = require("mn.lib").xnoremap
xnoremap("<", "<gv")
xnoremap(">", ">gv")
xnoremap("=", ">gv")
