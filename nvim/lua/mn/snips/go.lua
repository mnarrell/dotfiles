local ls = require "luasnip"

local s = ls.s
local f = ls.function_node

local go = {
	s(
		{ trig = "json", name = "JSON struct tag", dscr = [[`json:"fieldName"`]] },
		f(function()
			local matched = string.match(vim.api.nvim_get_current_line(), "%w+")
			if not matched then
				return ""
			end
			return string.format([[`json:"%s"`]], matched:gsub("^%u", string.lower))
		end)
	),
}

local ok, private = pcall(require, "mn.snips.go_private")
if ok then
	for _, v in ipairs(private) do
		table.insert(go, v)
	end
end

return go
