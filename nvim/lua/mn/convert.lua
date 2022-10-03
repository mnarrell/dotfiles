local M = {}

M.decode_base64 = function()
	-- b2hhaQ==
	vim.cmd [[noau normal! gv"vy]]
	local cmd = string.format("echo -n %s | base64 -d", vim.fn.getreg "v")
	local decoded = vim.fn.systemlist(cmd)

	-- vim.cmd "botright new"
	-- vim.api.nvim_buf_set_option(0, "buftype", "nofile")
	-- vim.api.nvim_buf_set_option(0, "swapfile", false)
	-- vim.api.nvim_buf_set_option(0, "bufhidden", "wipe")
	-- vim.api.nvim_buf_set_option(0, "buflisted", false)

	-- vim.api.nvim_buf_set_option(0, "modifiable", true)
	-- vim.api.nvim_buf_set_lines(0, 0, -1, false, decoded)
	-- vim.api.nvim_buf_set_option(0, "modifiable", false)

	local popup = require "nui.popup"
	local event = require("nui.utils.autocmd").event

	local win = popup {
		enter = true,
		focusable = true,
		border = {
			style = "rounded",
		},
		position = "50%",
		size = {
			width = "40%",
			height = "60%",
		},
	}

	win:mount()

	win:on(event.BufLeave, function()
		win:unmount()
	end)

	vim.api.nvim_buf_set_lines(win.bufnr, 0, 1, false, decoded)
end

M.as_confluence = function()
	local path = vim.fn.expand "%"
	local wiki = vim.fn.system("markdown2confluence " .. path)
	vim.fn.setreg("*", wiki)
end

return M
