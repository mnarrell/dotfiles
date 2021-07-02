-- vim.g.completion_auto_change_source = 1 -- Change the completion source automatically if no completion availabe
vim.g.completion_enable_snippet = "UltiSnips"
-- vim.g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}

-- vim.g.completion_matching_ignore_case = 1
-- vim.g.completion_trigger_keyword_length = 3 -- default = 1

vim.g.completion_customize_lsp_label = {
	Function = " [function]",
	Method = " [method]",
	Reference = " [refrence]",
	Enum = " [enum]",
	Field = "ﰠ [field]",
	Keyword = " [key]",
	Variable = " [variable]",
	Folder = " [folder]",
	Snippet = " [snippet]",
	Operator = " [operator]",
	Module = " [module]",
	Text = "ﮜ[text]",
	Class = " [class]",
	Interface = " [interface]",
}

vim.g.completion_chain_complete_list = {
	default = {
		{ complete_items = { "lsp", "snippet" } },
		{ complete_items = { "buffers" } },
		{ mode = "<c-p>" },
		{ mode = "<c-n>" },
	},
}
