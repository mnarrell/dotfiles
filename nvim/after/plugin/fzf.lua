vim.g.fzf_action = {
	["ctrl-t"] = "tab split",
	["ctrl-s"] = "split",
	["ctrl-v"] = "vsplit",
}

local nnoremap = require("mn.lib").nnoremap
nnoremap("q:", [[:History:<CR>]])
nnoremap("q/", [[:History/<CR>]])

local imap = require("mn.lib").imap
imap("<C-x><C-l>", [[<Plug>(fzf-complete-line)]])
imap("<C-x><C-k>", [[<Plug>(fzf-complete-word)]])
imap("<C-x><C-f>", [[<Plug>(fzf-complete-path)]])
imap("<C-x><C-j>", [[<Plug>(fzf-complete-file-ag)]])
