if not pcall(require, "mn.mappings") then
	return
end

local nnoremap = require("mn.mappings").nnoremap

nnoremap("tz", ":luafile ~/.config/nvim/init.lua<CR>", { silent = false })

nnoremap("<Leader>o", ":only<CR>")
nnoremap("<Leader>q", ":quit<CR>")
nnoremap("<Leader>x", ":xit<CR>")
nnoremap("<Leader>v", ":vsp<CR>")
nnoremap("<Leader>s", ":sp<CR>")
nnoremap("<Leader>k", ":bd!<CR>")
nnoremap("<Leader>w", ":<C-u>call functions#SaveAndExec()<CR>")

-- Toggle terminal
nnoremap("tv", ":vsplit<cr>:term<CR>")
nnoremap("ts", ":split<cr>:term<CR>")
nnoremap("tt", ":tabnew<cr>:term<CR>")

-- Make Y behave like C and D
nnoremap("Y", "y$")

-- Split navigation
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-l>", "<C-w>l")

-- Scroll the viewport faster
nnoremap("<C-e>", "5<C-e>")
nnoremap("<C-y>", "5<C-y>")

-- Force filetypes
nnoremap("_ba", ":set filetype=bash<CR>")
nnoremap("_df", ":set filetype=Dockerfile<CR>")
nnoremap("_hl", ":set filetype=helm<CR>")
nnoremap("_js", ":set filetype=json<CR>")
nnoremap("_lu", ":set filetype=lua<CR>")
nnoremap("_md", ":set filetype=markdown<CR>")
nnoremap("_py", ":set filetype=python<CR>")
nnoremap("_sh", ":set filetype=sh<CR>")
nnoremap("_tx", ":set filetype=text<CR>")
nnoremap("_vi", ":set filetype=vim<CR>")
nnoremap("_xm", ":set filetype=xml<CR>")
nnoremap("_ya", ":set filetype=yaml<CR>")
nnoremap("_zs", ":set filetype=zsh<CR>")

-- This was a nightmeer
nnoremap("k", [[(v:count > 5 ? "m'" . v:count : '') . 'k']], { expr = true })
nnoremap("j", [[(v:count > 5 ? "m'" . v:count : '') . 'j']], { expr = true })

-- This was a challenge. Not sure if it's worth it.
-- Clears search and Loupe highlights with <CR>, or <CR> if no selection...
nnoremap("<CR>", [[:lua require('mn.mappings').clear_highlight()<CR>]])

nnoremap("<Up>", ":cprevious<CR>")
nnoremap("<Down>", ":cnext<CR>")

-- nnoremap("tl", ":<C-u>call functions#ToggleLocationList()<CR>")
nnoremap("tl", ":TroubleToggle loclist<CR>")
-- nnoremap("tq", ":<C-u>call functions#ToggleQuickFix()<CR>")
nnoremap("tq", ":TroubleToggle quickfix<CR>")