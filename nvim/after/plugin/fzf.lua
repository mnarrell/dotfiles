vim.g.fzf_action = {
	["ctrl-t"] = "tab split",
	["ctrl-s"] = "split",
	["ctrl-v"] = "vsplit",
}

-- Mappings
local nnoremap = function(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true })
end

local imap = function(lhs, rhs)
	vim.keymap.set("i", lhs, rhs, { noremap = false, silent = false })
end

nnoremap("q:", [[:History:<CR>]])
nnoremap("q/", [[:History/<CR>]])

imap("<C-x><C-l>", [[<Plug>(fzf-complete-line)]])
imap("<C-x><C-k>", [[<Plug>(fzf-complete-word)]])
imap("<C-x><C-f>", [[<Plug>(fzf-complete-path)]])
imap("<C-x><C-j>", [[<Plug>(fzf-complete-file-ag)]])
