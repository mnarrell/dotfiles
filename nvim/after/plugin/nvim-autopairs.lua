local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
	vim.notify("Unable to load autopairs", vim.log.levels.ERROR)
	return
end

local yes, cmp = pcall(require, "cmp")
if not yes then
	vim.notify("cmp", vim.log.levels.ERROR)
	return
end

autopairs.setup { check_ts = true }
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
