local util = require "lspconfig.util"

local markdownlint = {
	lintCommand = "markdownlint -s -c ~/.config/efm-langserver/markdown.yaml",
	lintStdin = true,
	lintFormats = { "%f:%l %m", "%f:%l:%c %m", "%f: %l: %m" },
}

local prettier = {
	formatCommand = "prettier --stdin --stdin-filepath ${INPUT}",
	formatStdin = true,
}

-- local luaFormat = {
-- 	formatCommand = "lua-format -i",
-- 	formatStdin = true,
-- }

local yamllint = {
	lintCommand = "yamllint -f parsable -",
	lintStdin = true,
	lintIgnoreExitCode = true,
}

local languages = {
	markdown = { markdownlint },
	-- lua = { luaFormat },
	yaml = { yamllint, prettier },
}

return function(config, custom_attach)
	config.efm.setup {
		root_dir = util.root_pattern(".git", vim.fn.getcwd()),
		on_attach = custom_attach,
		filetypes = vim.tbl_keys(languages),
		init_options = { documentFormatting = true, codeAction = true },
		settings = {
			-- rootMarkers = {".git/"},
			rootMarkers = { vim.loop.cwd {} },
			-- log_level = 1,
			-- log_file = '~/efm.log',
			languages = languages,
		},
	}
end
