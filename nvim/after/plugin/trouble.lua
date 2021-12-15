local ok, trouble = pcall(require, "trouble")
if not ok then
	return
end

trouble.setup {
	height = 20,
	group = true,
	action_keys = {
		open_split = "<C-S>",
	},
	auto_preview = false,
}
