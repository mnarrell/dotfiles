-- if true then return end
if not pcall(require, "galaxyline") then
	return
end

local condition = require "galaxyline.condition"
local ale = require "mn.galaxyline.provider_ale"
local colors = require("galaxyline.theme").default
local theme = require("base16-colorscheme").colorschemes["tomorrow-night"]
local gl = require "galaxyline"
local devicons = require "nvim-web-devicons"

local buffer_not_empty = function()
	if vim.fn.empty(vim.fn.expand "%:t") ~= 1 then
		return true
	end
	return false
end

gl.short_line_list = { "netrw" }

vim.cmd(string.format("highlight GalaxyFileInfoModified guibg=%s guifg=#00aa00", "#555965"))
vim.cmd(string.format("highlight GalaxyFileInfoReadonly guibg=%s guifg=#ffa003", "#555965"))
vim.cmd(string.format("highlight GalaxyFileInfoRestricted guibg=%s guifg=#dc322f", "#555965"))
vim.cmd(string.format("highlight GalaxyFileInfoUnmodified guibg=%s guifg=%s", "#555965", theme.base0D:upper()))

local modes = {
	R = { label = "R", color = colors.purple },
	r = { label = "R", color = colors.purple },
	Rv = { label = "R", color = colors.purple },
	S = { label = "S", color = colors.orange },
	V = { label = "V", color = colors.blue },
	[""] = { label = "V", color = colors.blue },
	[""] = { label = "S", color = colors.green },
	__ = { label = "-", color = colors.green },
	c = { label = "C", color = colors.red },
	i = { label = "I", color = colors.blue },
	ic = { label = "I", color = colors.yellow },
	ix = { label = "I", color = colors.green },
	n = { label = "N", color = colors.green },
	ni = { label = "", color = colors.magenta },
	no = { label = "N", color = colors.magenta },
	s = { label = "S", color = colors.orange },
	t = { label = "T", color = colors.green },
	v = { label = "V", color = colors.magenta },
}

local icons = {
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

gl.section.left = {
	{
		AnchorLeftSep = {
			provider = function()
				return icons.sep.left
			end,
			highlight = { "#555965", colors.bg },
			separator = " ",
			separator_highlight = { colors.orange, "#555965" },
		},
	},
	{
		ViMode = {
			provider = function()
				local raw = vim.fn.mode()
				local current_mode = modes[raw]
				if not current_mode then
					print(string.format "UNDEFINED MODE! :%s', raw")
					return raw
				end
				vim.cmd(string.format("hi GalaxyViMode gui=bold guifg=%s guibg=%s", current_mode.color, "#555965"))
				return string.format("%s", current_mode.label)
			end,
			separator = " ",
			separator_highlight = { colors.orange, "#555965" },
		},
	},
	-- {
	--   StatusSpell = {
	--     provider = function()
	--       if vim.wo.spell then
	--         return '暈'
	--       end
	--       return '  '
	--     end,
	--     highlight = {theme.base0D:upper(),"#555965"},
	--     separator = ' ',
	--     separator_highlight = {colors.orange,"#555965"},
	--   }
	-- },
	{
		GitIcon = {
			condition = condition.check_git_workspace,
			highlight = { colors.orange, "#555965" },
			provider = function()
				return icons.git
			end,
			separator = " ",
			separator_highlight = { colors.orange, "#555965" },
		},
	},
	{
		GitBranch = {
			condition = condition.check_git_workspace,
			highlight = { theme.base0D:upper(), "#555965", "bold" },
			provider = "GitBranch",
			separator = " ",
			separator_highlight = { colors.orange, "#555965" },
		},
	},
	{
		FileInfo = {
			condition = buffer_not_empty,
			provider = function()
				if vim.bo.modified then
					vim.cmd "highlight link GalaxyFileInfo GalaxyFileInfoModified"
				elseif not vim.bo.modifiable then
					vim.cmd "highlight link GalaxyFileInfo GalaxyFileInfoRestricted"
				elseif vim.bo.readonly then
					vim.cmd "highlight link GalaxyFileInfo GalaxyFileInfoReadonly"
				elseif not vim.bo.modified then
					vim.cmd "highlight link GalaxyFileInfo GalaxyFileInfoUnmodified"
				end

				return vim.fn.fnamemodify(vim.fn.expand "%", ":~:.")
			end,
			separator = " ",
			separator_highlight = { colors.orange, "#555965" },
		},
	},
	{
		AnchorRightSep = {
			provider = function()
				return icons.sep.right
			end,
			highlight = { "#555965", colors.bg },
		},
	},
	{
		Spacing = {
			provider = function()
				return "     "
			end,
			highlight = { "#202328", "#202328" },
		},
	},
	{
		GolangStatusline = {
			provider = function()
				local status = {
					[""] = "",
					["[build|success]"] = "hooray 1",
				}

				local stat = vim.fn["go#statusline#Show"]()
				return status[stat] or stat
			end,
			condition = function()
				return "go" == vim.bo.filetype
			end,
		},
	},
	{
		DiagnosticError = {
			highlight = { colors.red, colors.bg },
			icon = "  ",
			provider = "DiagnosticError",
		},
	},
	{
		DiagnosticWarn = {
			provider = "DiagnosticWarn",
			icon = "  ",
			highlight = { colors.yellow, colors.bg },
		},
	},
}

gl.section.right = {
	{
		AnchorLeftSep = {
			provider = function()
				return icons.sep.left
			end,
			highlight = { "#555965", colors.bg },
		},
	},
	{
		FileFormat = {
			provider = function()
				local icon = devicons.get_icon(vim.fn.expand "%:e")
				return string.format("%s %s", icon or "", vim.bo.filetype)
			end,
			highlight = { theme.base0D:upper(), "#555965" },
			separator = " ",
			separator_highlight = { colors.orange, "#555965" },
		},
	},
	{
		PositionInfo = {
			provider = function()
				return string.format("%s:%s", vim.fn.line ".", vim.fn.col ".")
			end,
			highlight = { theme.base0D:upper(), "#555965", "bold" },
			condition = buffer_not_empty,
			separator = " ",
			separator_highlight = { colors.orange, "#555965" },
		},
	},
	{
		Warnings = {
			condition = ale.check_warnings,
			provider = ale.warnings,
			highlight = { colors.yellow, "#555965" },
			separator = " ",
			separator_highlight = { theme.base0D:upper(), "#555965", "bold" },
		},
	},
	{
		Errors = {
			condition = ale.check_errors,
			provider = ale.errors,
			highlight = { colors.red, "#555965" },
			separator = " ",
			separator_highlight = { theme.base0D:upper(), "#555965", "bold" },
		},
	},
	{
		WhiteSpace = {
			provider = "WhiteSpace",
			highlight = { "Red", "#555965" },
			separator = " ",
			separator_highlight = { theme.base0D:upper(), "#555965", "bold" },
		},
	},
	{
		AnchorRightSep = {
			provider = function()
				return icons.sep.right
			end,
			highlight = { "#555965", colors.bg },
			-- separator = ' ',
			separator_highlight = { colors.orange, "#555965" },
		},
	},
}

gl.section.short_line_left = {
	{
		ShortLinetFileInfo = {
			condition = buffer_not_empty,
			provider = function()
				return string.format("   %s", vim.fn.fnamemodify(vim.fn.expand "%", ":~:."))
			end,
			highlight = { "#555965", "#202328" },
		},
	},
}
