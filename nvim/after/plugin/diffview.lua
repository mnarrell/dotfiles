require("diffview").setup {
	enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
	view = {
		-- Configure the layout and behavior of different types of views.
		-- Available layouts:
		--  'diff1_plain'
		--    |'diff2_horizontal'
		--    |'diff2_vertical'
		--    |'diff3_horizontal'
		--    |'diff3_vertical'
		--    |'diff3_mixed'
		--    |'diff4_mixed'
		-- For more info, see ':h diffview-config-view.x.layout'.
		default = {
			-- Config for changed files, and staged files in diff views.
			layout = "diff2_horizontal",
		},
		merge_tool = {
			-- Config for conflicted files in diff views during a merge or rebase.
			layout = "diff3_horizontal",
			disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
		},
		file_history = {
			-- Config for changed files in file history views.
			layout = "diff2_horizontal",
		},
	},
	file_panel = {
		listing_style = "tree", -- One of 'list' or 'tree'
		tree_options = { -- Only applies when listing_style is 'tree'
			flatten_dirs = true, -- Flatten dirs that only contain one single dir
			folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
		},
		win_config = { -- See ':h diffview-config-win_config'
			position = "left",
			width = 35,
			win_opts = {},
		},
	},
	hooks = {
		diff_buf_read = function(_)
			-- Change local options in diff buffers
			vim.opt_local.list = false
			-- vim.opt_local.colorcolumn = { 80 }
		end,
		view_opened = function(view)
			local utils = require "mn.ui"
			-- Highlight 'DiffChange' as 'DiffDelete' on the left, and 'DiffAdd' on
			-- the right.
			local function post_layout()
				utils.tbl_ensure(view, "winopts.diff2.a")
				utils.tbl_ensure(view, "winopts.diff2.b")
				-- left
				view.winopts.diff2.a = utils.tbl_union_extend(view.winopts.diff2.a, {
					winhl = {
						"DiffChange:DiffAddAsDelete",
						"DiffText:DiffDeleteText",
					},
				})
				-- right
				view.winopts.diff2.b = utils.tbl_union_extend(view.winopts.diff2.b, {
					winhl = {
						"DiffChange:DiffAdd",
						"DiffText:DiffAddText",
					},
				})
			end

			view.emitter:on("post_layout", post_layout)
			post_layout()
		end,
	},
}
