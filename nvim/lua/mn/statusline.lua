local base16_loaded, scheme = pcall(require, "base16-colorscheme")
if not base16_loaded then return end

local devicons_loaded, devicons = pcall(require, "nvim-web-devicons")
if not devicons_loaded then return end

local theme = scheme.colorschemes["tomorrow-night"]

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
	-- diff = {
	-- 	add = " ",
	-- 	modified = " ",
	-- 	remove = " ",
	-- },
	git = "",
	-- file = {
	-- 	read_only = "",
	-- 	modified = "",
	-- },
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
	check_git_workspace = function()
		local filepath = vim.fn.expand "%:p:h"
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

M.mode = function()
	local raw = vim.fn.mode()
	local current_mode = M.modes[raw]
	if not current_mode then
		print(string.format "UNDEFINED MODE! :%s', raw")
		return raw
	end
	vim.cmd(string.format("hi StatusLineViMode gui=bold guifg=%s guibg=#555965", current_mode.color))
	return string.format("%s", current_mode.label)
end

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

	return vim.fn.fnamemodify(vim.fn.expand "%", ":~:.")
end

M.filetype = function()
	local icon = devicons.get_icon(vim.fn.expand "%:e")
	return string.format("%s %s", icon or "", vim.bo.filetype)
end

M.position_info = function()
	return string.format("%s:%s", vim.fn.line ".", vim.fn.col ".")
end

M.inactive_filename = function()
	return string.format("   %s", vim.fn.fnamemodify(vim.fn.expand "%", ":~:."))
end

M.mixed_indent = function()
	local space_pat = [[\v^ +]]
	local tab_pat = [[\v^\t+]]
	local space_indent = vim.fn.search(space_pat, "nwc")
	local tab_indent = vim.fn.search(tab_pat, "nwc")
	local mixed = (space_indent > 0 and tab_indent > 0)
	local mixed_same_line
	if not mixed then
		mixed_same_line = vim.fn.search([[\v^(\t+ | +\t)]], "nwc")
		mixed = mixed_same_line > 0
	end
	if not mixed then
		return ""
	end
	if mixed_same_line ~= nil and mixed_same_line > 0 then
		return "MI:" .. mixed_same_line
	end
	local space_indent_cnt = vim.fn.searchcount({ pattern = space_pat, max_count = 1e3 }).total
	local tab_indent_cnt = vim.fn.searchcount({ pattern = tab_pat, max_count = 1e3 }).total
	if space_indent_cnt > tab_indent_cnt then
		return "MI:" .. tab_indent
	else
		return "MI:" .. space_indent
	end
end

-- Highlight groups
local hi = require("base16-colorscheme").highlight
hi.StatusLineThemeNormalC = { guibg = M.colors.bg, guifg = M.colors.fg }
hi.StatusLineThemeInactiveC = "StatusLineThemeNormalC"
hi.StatusLineSeparator = { guifg = "#555965" }
hi.StatusLineTextBold = { guifg = theme.base0D:upper(), guibg = "#555965", gui = "bold" }

hi.StatusLineFileModified = { guibg = "#555965", guifg = "#00aa00" }
hi.StatusLineFileReadonly = { guibg = "#555965", guifg = "#ffa003" }
hi.StatusLineFileRestricted = { guibg = "#555965", guifg = "#dc322f" }
hi.StatusLineFileUnmodified = { guibg = "#555965", guifg = theme.base0D:upper() }

hi.StatusLineGitIcon = { guibg = "#555965", guifg = M.colors.orange }

hi.StatusLineInactiveFilename = { guibg = M.colors.bg, guifg = "#555965" }

hi.StatusLineDiagnosticError = { guibg = M.colors.bg, guifg = M.colors.red }
hi.StatusLineDiagnosticWarn = { guibg = M.colors.bg, guifg = M.colors.yellow }
hi.StatusLineDiagnosticInfo = { guibg = M.colors.bg, guifg = M.colors.cyan }

hi.StatusLineMixedIndent = "StatusLineDiagnosticError"

return M
