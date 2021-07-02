local telescope = require "telescope"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local builtin = require "telescope.builtin"
local themes = require "telescope.themes"

local custom_actions = {}

function custom_actions.fzf_multi_select(prompt_bufnr)
	local picker = action_state.get_current_picker(prompt_bufnr)
	-- local num_selections = table.getn(picker:get_multi_selection())
	local num_selections = #picker:get_multi_selection()

	if num_selections > 1 then
		-- actions.file_edit throws - context of picker seems to change
		--actions.file_edit(prompt_bufnr)
		actions.send_selected_to_qflist(prompt_bufnr)
		actions.open_qflist()
	else
		actions.file_edit(prompt_bufnr)
	end
end

telescope.setup {
	defaults = {
		mappings = {
			i = {
				["<C-x>"] = false,
				["<C-s>"] = actions.select_horizontal,
				-- ['<C-q>'] = actions.smart_send_to_qflist,
				["<C-y>"] = actions.send_to_loclist + actions.open_loclist,
				["<esc>"] = actions.close,
				["<tab>"] = actions.toggle_selection + actions.move_selection_next,
				["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
				["<cr>"] = custom_actions.fzf_multi_select
			},
			n = {
				["<tab>"] = actions.toggle_selection + actions.move_selection_next,
				["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
				["<cr>"] = custom_actions.fzf_multi_select,
			},
		},
		-- extensions = {
		--   fzf = {
		--     fuzzy = true,
		--     override_generic_sorter = true,
		--     override_file_sorter = true,
		--     case_mode = "ignore_case",
		--   }
		-- },
	},
}

telescope.load_extension "ultisnips"
-- telescope.load_extension('fzf')

local tele = {}

function tele.lsp_code_actions()
	local opts = themes.get_dropdown {
		winblend = 10,
		border = true,
		previewer = false,
		-- shorten_path = false,
	}

	require("telescope.builtin").lsp_code_actions(opts)
end

function tele.grep_prompt()
	require("telescope.builtin").grep_string {
		path_display = { "shorten" },
		search = vim.fn.input "🔍 > ",
	}
end

function tele.dotfiles()
	builtin.find_files { prompt_title = "~ dotfiles ~", cwd = "~/.dotfiles" }
end

function tele.buffers()
	builtin.buffers { sort_lastused = true }
end

function tele.ultisnips()
	require("telescope").extensions.ultisnips.ultisnips {}
end

local function telescope_mapping(key, target)
	local cmd = string.format([[<cmd>lua require('mn.telescope')['%s']()<CR>]], target)
	vim.api.nvim_set_keymap("n", key, cmd, { noremap = true, silent = true })
end

telescope_mapping("<leader>b", "buffers")
telescope_mapping("<leader>gf", "git_status")
telescope_mapping("<leader>f", "find_files")
telescope_mapping("<leader>m", "marks")
telescope_mapping("<leader>r", "grep_prompt")
telescope_mapping("<leader>d", "dotfiles")
telescope_mapping("<leader>h", "help_tags")
telescope_mapping("<leader>u", "ultisnips")
telescope_mapping("<leader>ca", "lsp_code_actions")

-- telescope_mapping('<leader>lg', 'live_grep')

return setmetatable({}, {
	__index = function(_, k)
		if tele[k] then
			return tele[k]
		else
			return builtin[k]
		end
	end,
})
