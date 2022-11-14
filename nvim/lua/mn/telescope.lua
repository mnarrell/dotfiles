local ok, telescope = pcall(require, "telescope")
if not ok then
	vim.notify("Unable to load telescope", vim.log.levels.ERROR)
	return
end

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
		file_ignore_patterns = { "vendor" },
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" },
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
		},
	},
}

telescope.load_extension "ui-select"

-- Mappings
local map = function(lhs, rhs)
	vim.keymap.set("n", lhs, rhs, { silent = true })
end

map("<leader>b", builtin.buffers)
map("<leader>gf", builtin.git_status)
map("<leader>f", builtin.find_files)
map("<leader>m", builtin.marks)
map("<leader>r", builtin.live_grep)
map("<leader>h", builtin.help_tags)

-- Commands
local find_hidden = function()
	builtin.find_files {
		find_command = { "fd", "--type", "f", "--hidden", "--no-ignore-vcs", "--strip-cwd-prefix", "--follow" },
	}
end
vim.api.nvim_create_user_command("FH", find_hidden, { bang = true })
