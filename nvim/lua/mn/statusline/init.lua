local theme = require("base16-colorscheme").colorschemes["tomorrow-night"]
local devicons = require "nvim-web-devicons"

vim.cmd "highlight StatusLineFileModified guibg=#555965 guifg=#00aa00"
vim.cmd "highlight StatusLineFileReadonly guibg=#555965 guifg=#ffa003"
vim.cmd "highlight StatusLineFileRestricted guibg=#555965 guifg=#dc322f"

vim.cmd(string.format("highlight StatusLineFileUnmodified guibg=#555965 guifg=%s", theme.base0D:upper()))

local M = {}

M.colors = {
	bg = "#202328",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

M.icons = {
	sep = {
		left = "",
		right = "",
	},
	diagnostic = {
		error = " ",
		warn = " ",
		info = " ",
	},
	diff = {
		add = " ",
		modified = " ",
		remove = " ",
	},
	git = "",
	file = {
		read_only = "",
		modified = "",
	},
}

M.modes = {
	R = { label = "R", color = M.colors.purple },
	r = { label = "R", color = M.colors.purple },
	Rv = { label = "R", color = M.colors.purple },
	S = { label = "S", color = M.colors.orange },
	V = { label = "V", color = M.colors.blue },
	[""] = { label = "V", color = M.colors.blue },
	[""] = { label = "S", color = M.colors.green },
	__ = { label = "-", color = M.colors.green },
	c = { label = "C", color = M.colors.red },
	i = { label = "I", color = M.colors.blue },
	ic = { label = "I", color = M.colors.yellow },
	ix = { label = "I", color = M.colors.green },
	n = { label = "N", color = M.colors.green },
	ni = { label = "", color = M.colors.magenta },
	no = { label = "N", color = M.colors.magenta },
	s = { label = "S", color = M.colors.orange },
	t = { label = "T", color = M.colors.green },
	v = { label = "V", color = M.colors.magenta },
}

M.conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand "%:t") ~= 1
	end,
	-- hide_in_width = function()
	-- 	return vim.fn.winwidth(0) > 80
	-- end,
	check_git_workspace = function()
		local filepath = vim.fn.expand "%:p:h"
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

M.file_info = function()
	if vim.bo.modified then
		vim.cmd "highlight link StatusLineFileInfo StatusLineFileModified"
	elseif not vim.bo.modifiable then
		vim.cmd "highlight link StatusLineFileInfo StatusLineFileRestricted"
	elseif vim.bo.readonly then
		vim.cmd "highlight link StatusLineFileInfo StatusLineFileReadonly"
	elseif not vim.bo.modified then
		vim.cmd "highlight link StatusLineFileInfo StatusLineFileUnmodified"
	end
end

M.filetype = function()
	print('OHAI!')
	local icon = devicons.get_icon(vim.fn.expand "%:e")
	return string.format("%s %s", icon or "", vim.bo.filetype)
end

return M
