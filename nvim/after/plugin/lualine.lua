local ok, lualine = pcall(require, "lualine")
if not ok then
	return
end

local statusline = require "mn.statusline"
local theme = require("base16-colorscheme").colorschemes["tomorrow-night"]

-- vim.cmd(string.format("highlight MNLuaLineSectionBackground guifg"))

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
	color = { fg = "#555965" },
	padding = { left = 0, right = 0 },
}

add_left {
	function()
		local raw = vim.fn.mode()
		local current_mode = statusline.modes[raw]
		if not current_mode then
			print(string.format "UNDEFINED MODE! :%s', raw")
			return raw
		end
		vim.cmd(string.format("hi MNLuaLineViMode gui=bold guifg=%s guibg=%s", current_mode.color, "#555965"))
		return string.format("%s", current_mode.label)
	end,
	color = "MNLuaLineViMode",
}

add_left {
	function()
		return statusline.icons.git
	end,
	cond = statusline.conditions.check_git_workspace,
	color = { fg = statusline.colors.orange, bg = "#555965" },
	padding = { left = 0, right = 0 },
}

add_left {
	"branch",
	icon = "",
	color = { fg = theme.base0D:upper(), bg = "#555965", gui = "bold" },
	padding = { left = 0, right = 0 },
}

add_left {
	function()
		statusline.file_info()
		return vim.fn.fnamemodify(vim.fn.expand "%", ":~:.")
	end,
	cond = statusline.conditions.buffer_not_empty,
	color = "StatusLineFileInfo",
}

add_left {
	function()
		return statusline.icons.sep.right
	end,
	color = { fg = "#555965" },
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

add_right {
	function()
		return statusline.icons.sep.left
	end,
	color = { fg = "#555965" },
	padding = { left = 0, right = 0 },
}

add_right {
	[[ require("mn.statusline").filetype() ]],
	color = { fg = theme.base0D:upper(), bg = "#555965", gui = "bold" },
	padding = { left = 0, right = 0 },
}

add_right {
	function()
		return string.format("%s:%s", vim.fn.line ".", vim.fn.col ".")
	end,
	color = { fg = theme.base0D:upper(), bg = "#555965", gui = "bold" },
}

add_right {
	function()
		return statusline.icons.sep.right
	end,
	color = { fg = "#555965" },
	padding = { left = 0, right = 0 },
}

lualine.setup(config)
