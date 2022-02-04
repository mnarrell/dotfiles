local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end

configs.setup {
	ensure_installed = "maintained",
	sync_install = false,

	highlight = {
		enable = true,
		disable = { "make" },
		additional_vim_regex_highlighting = false,
	},

	-- incremental_selection = {
	-- 	enable = true,
	-- 	keymaps = {
	-- 		init_selection = "gnn",
	-- 		node_incremental = "grn",
	-- 		scope_incremental = "grc",
	-- 		node_decremental = "grm",
	-- 	},
	-- },

	indent = {
		enable = true,
		disable = { "yaml" },
	},

	custom_captures = {
		["comment"] = "Comment",
	},

	rainbow = {
		enable = true,
		extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},

	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- ["af"] = "@function.outer",
				-- ["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
			},
		},
	},

	autopairs = { enable = true },
}
