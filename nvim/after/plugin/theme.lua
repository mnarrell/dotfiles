if not pcall(require, "base16-colorscheme") then
	return
end

local NONE = "NONE"
local base16 = require "base16-colorscheme"
local theme = base16.colorschemes["tomorrow-night"]
local hi = base16.highlight

base16.setup "tomorrow-night"

local M = {}

M.apply_highlights = function()
	-- Look and feel
	hi.StatusLine = { guifg = NONE, guibg = NONE, gui = NONE, guisp = nil }
	hi.SignColumn = { guifg = theme.base03, guibg = theme.base01, gui = NONE, guisp = nil }
	hi.LineNr = { guifg = theme.base03, guibg = theme.base01, gui = NONE, guisp = nil }
	hi.CursorLineNr = { guifg = theme.base0D, guibg = nil, gui = NONE, guisp = nil }
	hi.IncSearch = { guifg = "Yellow", guibg = theme.base0D, gui = NONE, guisp = nil }
	hi.HighlightedyankRegion = { guifg = nil, guibg = theme.base0D, gui = NONE, guisp = nil }
	hi.VertSplit = { guifg = theme.base02, guibg = theme.base02, gui = NONE, guisp = nil }

	-- LSP Signs
	hi.DiagnosticSignError = { guifg = "Red", guibg = theme.base01, gui = NONE, guisp = nil }
	hi.DiagnosticSignWarn= { guifg = "Yellow", guibg = theme.base01, gui = NONE, guisp = nil }
	hi.DiagnosticSignHint = { guifg = theme.base0D, guibg = theme.base01, gui = NONE, guisp = nil }

	hi.LspDiagnosticsVirtualTextError = { guifg = "Red", ctermfg = "Red" }
	hi.LspDiagnosticsVirtualTextWarning = { guifg = "Yellow", ctermfg = "Yellow" }
	hi.LspDiagnosticsVirtualTextInformation = { guifg = "White", ctermfg = "White" }
	hi.LspDiagnosticsVirtualTextHint = { guifg = "White", ctermfg = "White" }

	hi.LspDiagnosticsUnderlineError = { guifg = NONE, gui = "underline" }
	hi.LspDiagnosticsUnderlineWarning = { guifg = NONE, gui = "underline" }
	hi.LspDiagnosticsUnderlineInformation = { guifg = NONE, gui = "underline" }
	hi.LspDiagnosticsUnderlineHint = { guifg = NONE, gui = "underline" }

	hi.StatusLineNC = { gui = NONE, guibg = "#202328", guifg = NONE }

	-- Popup Menu
	hi.PmenuSbar = { guifg = nil, guibg = theme.base0D, gui = NONE, guisp = nil }
	hi.PmenuSel = { guifg = nil, guibg = theme.base0D, gui = NONE, guisp = nil }
	hi.PmenuThumb = { guifg = nil, guibg = theme.base0D, gui = NONE, guisp = nil }

	-- GitGutter highlighting
	hi.GitGutterAdd = { guifg = theme.base0B, guibg = theme.base01, gui = NONE, guisp = nil }
	hi.GitGutterChange = { guifg = theme.base0D, guibg = theme.base01, gui = NONE, guisp = nil }
	hi.GitGutterDelete = { guifg = theme.base08, guibg = theme.base01, gui = NONE, guisp = nil }
	hi.GitGutterChangeDelete = { guifg = theme.base0E, guibg = theme.base01, gui = NONE, guisp = nil }

	-- HTML highlighting
	hi.htmlBold = { guifg = theme.base0A, guibg = nil, gui = NONE, guisp = nil }
	hi.htmlItalic = { guifg = theme.base0E, guibg = nil, gui = NONE, guisp = nil }
	hi.htmlEndTag = { guifg = theme.base05, guibg = nil, gui = NONE, guisp = nil }
	hi.htmlTag = { guifg = theme.base05, guibg = nil, gui = NONE, guisp = nil }

	-- Markdown highlighting
	hi.markdownCode = { guifg = theme.base0B, guibg = nil, gui = NONE, guisp = nil }
	hi.markdownError = { guifg = theme.base05, guibg = theme.base00, gui = NONE, guisp = nil }
	hi.markdownCodeBlock = { guifg = theme.base0B, guibg = nil, gui = NONE, guisp = nil }
	hi.markdownHeadingDelimiter = { guifg = theme.base0D, guibg = nil, gui = NONE, guisp = nil }

	-- Python highlighting
	hi.pythonOperator = { guifg = theme.base0E, guibg = nil, gui = NONE, guisp = nil }
	hi.pythonRepeat = { guifg = theme.base0E, guibg = nil, gui = NONE, guisp = nil }
	hi.pythonInclude = { guifg = theme.base0E, guibg = nil, gui = NONE, guisp = nil }
	hi.pythonStatement = { guifg = theme.base0E, guibg = nil, gui = NONE, guisp = nil }

	-- Ruby highlighting
	hi.rubyAttribute = { guifg = theme.base0D, guibg = nil, gui = NONE, guisp = nil }
	hi.rubyConstant = { guifg = theme.base0A, guibg = nil, gui = NONE, guisp = nil }
	hi.rubyInterpolationDelimiter = { guifg = theme.base0F, guibg = nil, gui = NONE, guisp = nil }
	hi.rubyRegexp = { guifg = theme.base0C, guibg = nil, gui = NONE, guisp = nil }
	hi.rubySymbol = { guifg = theme.base0B, guibg = nil, gui = NONE, guisp = nil }
	hi.rubyStringDelimiter = { guifg = theme.base0B, guibg = nil, gui = NONE, guisp = nil }

	-- vim.api.nvim_command('highlight! clear Search')
	vim.api.nvim_command "highlight! link Search Underlined"
	-- vim.api.nvim_command('highlight! link QuickFixLine PmenuSel')

	-- vim.api.nvim_command('highlight! link TSComment Comment')
end

M.apply_highlights()

vim.cmd [[
	augroup theme
		autocmd!
		autocmd ColorScheme * lua require('plugins.theme').apply_highlights()
	augroup END
]]

vim.cmd [[
	highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
	highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
	highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
	highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
	highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
	highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
]]

return M
