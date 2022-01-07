local ok, notify = pcall(require, "notify")
if not ok then
	emit "Unable to load nvim-notify"
	return
end

notify.setup { timeout = 2000, }

-- Override the default notify function
vim.notify = notify
