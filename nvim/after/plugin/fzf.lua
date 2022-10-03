vim.g.fzf_action = {
	["ctrl-t"] = "tab split",
	["ctrl-s"] = "split",
	["ctrl-v"] = "vsplit",
}

local map = function(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, { silent = true })
end

map("q:", [[:History:<CR>]])
map("q/", [[:History/<CR>]])

-- local imap = require("mn.lib").imap
-- imap("<C-x><C-l>", [[<Plug>(fzf-complete-line)]])
-- imap("<C-x><C-k>", [[<Plug>(fzf-complete-word)]])
-- imap("<C-x><C-f>", [[<Plug>(fzf-complete-path)]])
-- imap("<C-x><C-j>", [[<Plug>(fzf-complete-file-ag)]])
