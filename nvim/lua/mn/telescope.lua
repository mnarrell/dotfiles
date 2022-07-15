local telescope = require "telescope"
local actions = require "telescope.actions"
local builtin = require "telescope.builtin"

local my_maps = {
	["<C-a>"] = actions.select_all,
	["<C-x>"] = false,
	["<C-s>"] = actions.select_horizontal,
	["<C-y>"] = actions.send_selected_to_loclist,
	-- ["<tab>"] = actions.toggle_selection,
}

telescope.setup {
	defaults = {
		mappings = {
			i = my_maps,
			n = my_maps,
		},
	},
}

telescope.load_extension('ui-select')

local tele = {}

function tele.find_files()
	-- local cmd = { "fd", "--type", "f", "--hidden", "--no-ignore", "--exclude", "vendor", "--exclude", ".git" }
	local cmd = { "fd", "--type", "f", "--hidden" }
	builtin.find_files { find_command = cmd }
end

function tele.grep_prompt()
	require("telescope.builtin").grep_string {
		path_display = { "shorten" },
		search = vim.fn.input "🔍 > ",
	}
end

function tele.buffers()
	builtin.buffers { sort_lastused = true }
end

function tele.help_tags()
	builtin.help_tags {
		prompt_title = "~ Help Tags ~",
		initial_mode = "insert",
		sorting_strategy = "ascending",
		layout_config = {
			prompt_position = "top",
			preview_width = 0.75,
			height = 0.6,
		},
		preview = {
			preview_cutoff = 120,
			preview_width = 80,
			hide_on_startup = false,
		},
	}
end

local function telescope_mapping(key, target)
	local cmd = string.format([[<cmd>lua require('mn.telescope')['%s']()<CR>]], target)
	vim.keymap.set("n", key, cmd, { noremap = true, silent = true })
end

telescope_mapping("<leader>b", "buffers")
telescope_mapping("<leader>gf", "git_status")
telescope_mapping("<leader>f", "find_files")
telescope_mapping("<leader>m", "marks")
telescope_mapping("<leader>r", "live_grep")
telescope_mapping("<leader>h", "help_tags")
telescope_mapping("<leader>ls", "lsp_document_symbols")

return setmetatable({}, {
	__index = function(_, k)
		if tele[k] then
			return tele[k]
		else
			return builtin[k]
		end
	end,
})
