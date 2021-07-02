if not pcall(require, "mn.mappings") then
	return
end

local vnoremap = require("mn.mappings").vnoremap
local xnoremap = require("mn.mappings").xnoremap

vnoremap(".", ":normal .<CR>")
vnoremap("Q", ":normal @q<CR>")
xnoremap("<", "<gv")
xnoremap(">", ">gv")
xnoremap("=", ">gv")
