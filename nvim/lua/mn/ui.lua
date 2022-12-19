local M = {}

function M.tbl_ensure(t, table_path)
	local keys = type(table_path) == "table" and table_path or vim.split(table_path, ".", { plain = true })

	if not M.tbl_access(t, keys) then
		M.tbl_set(t, keys, {})
	end
end

function M.tbl_access(t, table_path)
	local keys = type(table_path) == "table" and table_path or vim.split(table_path, ".", { plain = true })

	local cur = t

	for _, k in ipairs(keys) do
		cur = cur[k]
		if not cur then
			return nil
		end
	end

	return cur
end

function M.tbl_union_extend(t, ...)
	local res = M.tbl_clone(t)

	local function recurse(ours, theirs)
		-- Get the union of the two tables
		local sub = M.vec_union(ours, theirs)

		for k, v in pairs(ours) do
			if type(k) ~= "number" then
				sub[k] = v
			end
		end

		for k, v in pairs(theirs) do
			if type(k) ~= "number" then
				if type(v) == "table" then
					sub[k] = recurse(sub[k] or {}, v)
				else
					sub[k] = v
				end
			end
		end

		return sub
	end

	for _, theirs in ipairs { ... } do
		res = recurse(res, theirs)
	end

	return res
end

function M.tbl_clone(t)
	local clone = {}

	for k, v in pairs(t) do
		clone[k] = v
	end

	return clone
end

function M.vec_union(...)
	local result = {}
	local args = { ... }
	local seen = {}

	for i = 1, select("#", ...) do
		if type(args[i]) ~= "nil" then
			if type(args[i]) ~= "table" and not seen[args[i]] then
				seen[args[i]] = true
				result[#result + 1] = args[i]
			else
				for _, v in ipairs(args[i]) do
					if not seen[v] then
						seen[v] = true
						result[#result + 1] = v
					end
				end
			end
		end
	end

	return result
end

return M
