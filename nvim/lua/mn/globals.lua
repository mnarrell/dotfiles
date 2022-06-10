P = function(v)
	print(vim.inspect(v))
	return v
end

RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end

-- Convenience functions Lua lacks...
function string.startswith(self, str)
	return self:sub(1, #str) == str
end

function string.endswith(self, str)
	return self:sub(-#str) == str
end
