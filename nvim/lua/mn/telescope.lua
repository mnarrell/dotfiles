local telescope = require "telescope"
local actions = require "telescope.actions"
local builtin = require "telescope.builtin"
local themes = require "telescope.themes"

local my_maps = {
	["<C-x>"] = false,
	["<C-s>"] = actions.select_horizontal,
	["<C-y>"] = actions.send_selected_to_loclist,
	["<tab>"] = actions.toggle_selection,
}

telescope.setup {
	defaults = {
		mappings = {
			i = my_maps,
			n = my_maps,
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

function tele.find_files()
	-- local cmd = { "fd", "--type", "f", "--hidden", "--no-ignore", "--exclude", "vendor", "--exclude", ".git" }
	local cmd = { "fd", "--type", "f", "--hidden" }
	builtin.find_files { find_command = cmd }
end

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

telescope_mapping("<leader>fb", "buffers")
telescope_mapping("<leader>fg", "git_status")
telescope_mapping("<leader>ff", "find_files")
telescope_mapping("<leader>fm", "marks")
telescope_mapping("<leader>fr", "grep_prompt")
telescope_mapping("<leader>fd", "dotfiles")
telescope_mapping("<leader>fh", "help_tags")
telescope_mapping("<leader>fu", "ultisnips")
telescope_mapping("<leader>ca", "lsp_code_actions")

telescope_mapping("<leader>lg", "live_grep")

return setmetatable({}, {
	__index = function(_, k)
		if tele[k] then
			return tele[k]
		else
			return builtin[k]
		end
	end,
})
