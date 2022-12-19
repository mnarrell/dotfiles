local Job = require "plenary.job"

local allow = function()
	local cmd = "silent !direnv allow " .. vim.fn.fnamemodify(vim.fn.expand "%", ":~:.")
	vim.api.nvim_exec(cmd, false)
	vim.notify("direnv updated", vim.log.levels.INFO)

	-- Job
	-- 	:new({
	-- 		command = "direnv",
	-- 		args = { "allow", vim.fn.fnamemodify(vim.fn.expand "%", ":~:.") },
	-- 		on_exit = function(j, return_val)
	-- 			-- print "direnv updated"
	-- 		end,
	-- 	})
	-- 	:sync() -- or start()
end

vim.api.nvim_buf_create_user_command(0, "DA", allow, { bang = true })

local autocmds = vim.api.nvim_create_augroup("direnvAutocmds", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function(_)
		-- vim.notify("direnv updated", vim.log.levels.INFO)
		allow()
	end,
	group = autocmds,
	buffer = 0,
})
