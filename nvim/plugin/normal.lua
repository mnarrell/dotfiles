local map = function(lhs, rhs, opts)
	opts = vim.tbl_extend("force", { silent = true }, opts or {})
	vim.keymap.set("n", lhs, rhs, opts)
end

map("Q", "<Nop>")

map("n", "nzzzv")
map("N", "Nzzzv")

map("<Leader>o", ":only<CR>")
map("<Leader>q", ":quit<CR>")
map("<Leader>x", ":xit<CR>")
map("<Leader>v", ":vsp<CR>")
map("<Leader>s", ":sp<CR>")
map("<Leader>k", ":bd!<CR>")
-- map("<Leader>w", ":<C-u>call functions#SaveAndExec()<CR>")
map("<Leader>w", SaveAndReload)

-- Make Y behave like C and D
map("Y", "y$")

-- Split navigation
map("<C-j>", "<C-w>j")
map("<C-k>", "<C-w>k")
map("<C-h>", "<C-w>h")
map("<C-l>", "<C-w>l")

-- Scroll the viewport faster
map("<C-e>", "5<C-e>")
map("<C-y>", "5<C-y>")

-- Force filetypes
map("_ba", ":set filetype=bash<CR>")
map("_co", ":set filetype=conf<CR>")
map("_df", ":set filetype=Dockerfile<CR>")
map("_hl", ":set filetype=helm<CR>")
map("_js", ":set filetype=json<CR>")
map("_lu", ":set filetype=lua<CR>")
map("_md", ":set filetype=markdown<CR>")
map("_py", ":set filetype=python<CR>")
map("_sh", ":set filetype=sh<CR>")
map("_tx", ":set filetype=text<CR>")
map("_vi", ":set filetype=vim<CR>")
map("_xm", ":set filetype=xml<CR>")
map("_ya", ":set filetype=yaml<CR>")
map("_zs", ":set filetype=zsh<CR>")
map("_an", ":set filetype=yaml.ansible<CR>")

-- This was a nightmeer
map("k", [[(v:count > 5 ? "m'" . v:count : '') . 'k']], { expr = true })
map("j", [[(v:count > 5 ? "m'" . v:count : '') . 'j']], { expr = true })

-- This was a challenge. Not sure if it's worth it.
-- Clears search and Loupe highlights with <CR>, or <CR> if no selection...
map("<CR>", function()
	if vim.api.nvim_get_vvar "hlsearch" ~= 0 then
		vim.cmd "nohlsearch"
		vim.cmd "normal! call loupe#private#clean_highlight()<CR>"
	else
		local key = vim.api.nvim_replace_termcodes("<CR>", true, true, true) or ""
		vim.api.nvim_feedkeys(key, "n", true)
	end
end)

-- map("<Up>", ":cprevious<CR>")
-- map("<Down>", ":cnext<CR>")

map("tl", function()
	vim.cmd "botright lopen 20"
end)

map("tq", function()
	vim.cmd "botright copen 20"
end)

map("<Leader>t", ":tabnew<CR>")
