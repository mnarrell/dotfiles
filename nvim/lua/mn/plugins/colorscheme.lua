return {
  "RRethy/nvim-base16",
  config = function()
    local base16 = require("base16-colorscheme")
    base16.setup("tomorrow-night")

    local theme = base16.colorschemes["tomorrow-night"]
    local hi = base16.highlight

    local NONE = "NONE"

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
    hi.DiagnosticSignWarn = { guifg = "Yellow", guibg = theme.base01, gui = NONE, guisp = nil }
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

    -- Telescope
    -- https://github.com/nvim-telescope/telescope.nvim/blob/master/plugin/telescope.vim
    local teleCanvas = "#1A1B1D"
    hi.TelescopePromptBorder = { guifg = teleCanvas, guibg = teleCanvas, gui = NONE }
    hi.TelescopePromptNormal = { guifg = NONE, guibg = teleCanvas, gui = NONE }
    hi.TelescopePromptPrefix = { guifg = theme.base0D, guibg = NONE, gui = NONE }
    hi.TelescopePromptTitle = { guifg = theme.base0D, guibg = NONE, gui = NONE }

    hi.TelescopePreviewTitle = { guifg = theme.base0D, guibg = NONE, gui = NONE }

    -- hi.DiffAdd = { gui = NONE, guifg = NONE, guibg = "#2C3B4B" }
    -- -- hi.DiffChange = { gui = NONE, guifg = NONE, guibg = "#e5d5ac" }
    -- hi.DiffDelete = { guifg = "Grey", guibg = "#1f0201", gui = NONE, guisp = nil }
    -- hi.DiffText = { guifg = NONE, guibg = "#2C3B4B", gui = NONE, guisp = nil }

    hi.DiffAdd = { gui = NONE, guifg = NONE, guibg = "#103235" }
    hi.DiffChange = { gui = NONE, guifg = NONE, guibg = "#272D43" }
    hi.DiffText = { gui = NONE, guifg = NONE, guibg = "#394b70" }
    hi.DiffDelete = { gui = NONE, guifg = NONE, guibg = "#3F2D3D" }
    -- hi.DiffviewDiffAddAsDelete = { guibg = "#3f2d3d", gui = NONE, guifg = NONE }
    -- hi.DiffviewDiffDelete = { gui = NONE, guifg = "#3B4252", guibg = NONE }

    -- Left panel
    -- "DiffChange:DiffAddAsDelete",
    -- "DiffText:DiffDeleteText",
    -- hi.DiffAddAsDelete = { gui = NONE, guifg = NONE, guibg = "#3F2D3D" }
    -- hi.DiffDeleteText = { gui = NONE, guifg = NONE, guibg = "#4B1818" }

    -- Right panel
    -- "DiffChange:DiffAdd",
    -- "DiffText:DiffAddText",
    -- hi.DiffAddText = { gui = NONE, guifg = NONE, guibg = "#1C5458" }

    -- vim.api.nvim_command('highlight! clear Search')
    vim.api.nvim_command("highlight! link Search Underlined")
    -- vim.api.nvim_command('highlight! link QuickFixLine PmenuSel')

  end,
}
