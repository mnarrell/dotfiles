local autocmds = vim.api.nvim_create_augroup("auto", { clear = true })

vim.api.nvim_create_autocmd({ "FocusLost", "WinLeave" }, {
	command = ":silent! wa",
	pattern = "*",
	group = autocmds,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(_)
		local pos = vim.fn.winsaveview()
		local cmds = {
			[[%s/\v\s+$//e]],
			[[%s/\($\n\s*\)\+\%$//e]],
		}
		for _, cmd in pairs(cmds) do
			vim.cmd(cmd)
		end
		vim.fn.winrestview(pos)
	end,
	pattern = "*",
	group = autocmds,
})

vim.api.nvim_create_autocmd("VimResized", {
	command = ":wincmd =",
	pattern = "*",
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

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
-- 		-- print(client.name .. " attached to dis")
-- 		require("mn.log").log(client.name .. " attached to dis")
-- 		require("mn.lsp.support").mappings(args.data.client_id)
-- 	end,
-- 	group = autocmds,
-- 	pattern = "*.go",
-- })
