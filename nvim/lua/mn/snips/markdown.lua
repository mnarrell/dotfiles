local markdown = {}

local ok, private = pcall(require, "mn.snips.markdown_private")
if ok then
	for _, v in ipairs(private) do
		table.insert(markdown, v)
	end
end

return markdown
