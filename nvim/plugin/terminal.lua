if not pcall(require, "mn.mappings") then
	return
end

local tnoremap = require("mn.mappings").tnoremap

tnoremap("<Esc>", [[<C-\><C-n>]])
tnoremap("<Leader>q", [[<C-\><C-n> :bd!<CR>]])