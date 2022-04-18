if not pcall(require, "gitsigns") then
	return
end

require("gitsigns").setup {
	on_attach = function(bufnr)
		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
		map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })
	end,
	-- signs = {
	-- 	add = { hl = "GitGutterAdd", text = "│" },
	-- 	change = { hl = "GitGutterChange", text = "│" },
	-- 	delete = { hl = "GitGutterDelete", text = "_" },
	-- 	topdelete = { hl = "GitGutterDelete", text = "‾" },
	-- 	changedelete = { hl = "GitGutterChange", text = "~" },
	-- },
	-- signs = {
	--   add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
	--   change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
	--   delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
	--   topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
	--   changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
	-- },
	-- keymaps = {
	-- 	-- Default keymap options
	-- 	noremap = true,
	-- 	buffer = true,

	-- 	["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
	-- 	["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
	-- 	["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
	-- 	["n <leader>hR"] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
	-- 	["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
	-- 	["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
	-- },
	-- watch_index = {
	-- 	interval = 1000,
	-- },
	-- current_line_blame = false,
	-- sign_priority = 6,
	-- update_debounce = 100,
	-- status_formatter = nil, -- Use default
	-- use_decoration_api = true,
	-- use_internal_diff = true, -- If luajit is present
}
