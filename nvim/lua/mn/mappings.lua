local tools = {}

-- Convenience functions Lua lacks...
function string.startswith(self, str)
	return self:sub(1, #str) == str
end

function string.endswith(self, str)
	return self:sub(-#str) == str
end

-- reload a lua module
function tools.reload(fcn)
	require("plenary.reload").reload_module(fcn)
end

-- Create dictionary keys for embedded functions.
function tools.escape_keymap(key)
	return "k" .. key:gsub(".", string.byte)
end

return tools
