vim.g.fzf_action = {
	["ctrl-t"] = "tab split",
	["ctrl-s"] = "split",
	["ctrl-v"] = "vsplit",
}

local nnoremap = require("mn.mappings").nnoremap
local nmap = require("mn.mappings").nmap
local imap = require("mn.mappings").imap

nnoremap("q:", [[:History:<CR>]])
nnoremap("q/", [[:History/<CR>]])

nmap("<Leader><tab>", [[<Plug>(fzf-maps-n)]])
imap("<C-x><C-l>", [[<Plug>(fzf-complete-line)]])
imap("<C-x><C-k>", [[<Plug>(fzf-complete-word)]])
imap("<C-x><C-f>", [[<Plug>(fzf-complete-path)]])
imap("<C-x><C-j>", [[<Plug>(fzf-complete-file-ag)]])

-- nnoremap('<leader>b', [[:Buffers<CR>]])
-- nnoremap('<leader>gf', 'git_status')
-- nnoremap('<leader>f', [[:Files<CR>]])
