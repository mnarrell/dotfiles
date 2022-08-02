local telescope = require "telescope"
local actions = require "telescope.actions"
local builtin = require "telescope.builtin"

local my_maps = {
	["<C-a>"] = actions.select_all,
	["<C-x>"] = false,
	["<C-s>"] = actions.select_horizontal,
	["<C-y>"] = actions.send_selected_to_loclist,
	-- ["<tab>"] = actions.toggle_selection,
	["<esc>"] = actions.close,
}

telescope.setup {
	defaults = {
		mappings = {
			i = my_maps,
			n = my_maps,
		},
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" }
		},
		help_tags = {
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
	},
}

telescope.load_extension('ui-select')

local nnoremap = require("mn.lib").nnoremap
nnoremap("<leader>b", builtin.buffers)
nnoremap("<leader>gf", builtin.git_status)
nnoremap("<leader>f", builtin.find_files)
nnoremap("<leader>m", builtin.marks)
nnoremap("<leader>r", builtin.live_grep)
nnoremap("<leader>h", builtin.help_tags)

local command = require("mn.lib").command
command("FH", function()
	builtin.find_files({ find_command = {
		"fd", "--type", "f", "--hidden", "--no-ignore-vcs", "--strip-cwd-prefix", "--follow"
	} })

end)
