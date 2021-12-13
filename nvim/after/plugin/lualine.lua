local ok, lualine = pcall(require, "lualine")
if not ok then
	return
end

local statusline = require "mn.statusline"

local whitespace = require("lualine.component"):extend()

whitespace.draw = function()
	return statusline.whitespace()
end

local config = {
	options = {
		-- Disable sections and component separators
		component_separators = "",
		section_separators = "",
		disabled_filetypes = { "netrw" },
		theme = {
			normal = { c = { fg = statusline.colors.fg, bg = statusline.colors.bg } },
			inactive = { c = { fg = statusline.colors.fg, bg = statusline.colors.bg } },
		},
	},
	sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	inactive_sections = {
		-- these are to remove the defaults
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
}

local add_left = function(component)
	table.insert(config.sections.lualine_a, component)
end

local add_right = function(component)
	table.insert(config.sections.lualine_x, component)
end

add_left {
	function()
		return statusline.icons.sep.left
	end,
	color = "StatusLineSeparator",
	padding = { left = 0, right = 0 },
}

add_left {
	[[ require("mn.statusline").mode() ]],
	color = "StatusLineViMode",
}

add_left {
	function()
		return statusline.icons.git
	end,
	cond = statusline.conditions.check_git_workspace,
	color = "StatusLineGitIcon",
	padding = { left = 0, right = 0 },
}

add_left {
	"branch",
	icon = "",
	color = "StatusLineTextBold",
	padding = { left = 0, right = 0 },
}

add_left {
	[[ require("mn.statusline").file_info() ]],
	cond = statusline.conditions.buffer_not_empty,
	color = "StatusLineFileInfo",
}

add_left {
	function()
		return statusline.icons.sep.right
	end,
	color = "StatusLineSeparator",
	padding = { left = 0, right = 0 },
}

add_left {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = statusline.colors.red },
		color_warn = { fg = statusline.colors.yellow },
		color_info = { fg = statusline.colors.cyan },
	},
}

add_left {
	[[ require("mn.statusline").whitespace() ]],
	color = { fg = statusline.colors.red},
}

add_right {
	function()
		return statusline.icons.sep.left
	end,
	color = "StatusLineSeparator",
	padding = { left = 0, right = 0 },
}

add_right {
	[[ require("mn.statusline").filetype() ]],
	color = "StatusLineTextBold",
	padding = { left = 0, right = 0 },
}

add_right {
	[[ require("mn.statusline").position_info() ]],
	color = "StatusLineTextBold",
}

add_right {
	function()
		return statusline.icons.sep.right
	end,
	color = "StatusLineSeparator",
	padding = { left = 0, right = 0 },
}

lualine.setup(config)
