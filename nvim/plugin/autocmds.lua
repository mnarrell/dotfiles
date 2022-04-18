local autocmds = vim.api.nvim_create_augroup("FTDetect", { clear = true })

vim.api.nvim_create_autocmd({ "FocusLost", "WinLeave" }, {
	command = ":silent! wa",
	pattern = "*",
	group = autocmds,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	command = [[:call functions#Preserve('%s/\v\s+$//e')]],
	pattern = "*",
	group = autocmds,
})

vim.api.nvim_create_autocmd("VimResized", {
	command = ":wincmd =",
	pattern = "*",
	group = autocmds,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	command = "PackerCompile",
	pattern = "*/mn/plugins.lua",
	group = autocmds,
})

vim.api.nvim_create_autocmd("TermOpen", {
	command = [[
		setlocal nolist nonumber norelativenumber noshowmode nospell
		startinsert
	]],
	pattern = "*",
	group = autocmds,
})

vim.api.nvim_create_autocmd("FileType", {
	command = "nnoremap <buffer><silent> q :close <CR>",
	pattern = "lspinfo",
	group = autocmds,
})
