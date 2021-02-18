local telescope = require('telescope')
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-x>'] = false,
        ['<C-s>'] = actions.select_horizontal,
        ['<C-q>'] = actions.smart_send_to_qflist,
      }
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      }
    }
  }
}

telescope.load_extension('fzy_native')
telescope.load_extension('ultisnips')

local tele = {}

function tele.lsp_code_actions()
  local opts = themes.get_dropdown {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }

  require('telescope.builtin').lsp_code_actions(opts)
end

function tele.grep_prompt()
  require('telescope.builtin').grep_string {
    shorten_path = true,
    search = vim.fn.input("🔍 > "),
    -- search = vim.fn.input("Grep String > "),
  }
end

function tele.dotfiles()
  builtin.find_files {prompt_title = '~ dotfiles ~', cwd = '~/.dotfiles'}
end

function tele.buffers()
  builtin.buffers({sort_lastused = true})
end

local function telescope_mapping(key, target)
  vim.api.nvim_set_keymap('n', key, string.format(
  [[<cmd>lua require('plugins.telescope')['%s']()<CR>]],
  target), {noremap = true, silent = true})
end

telescope_mapping('<leader>b', 'buffers')
telescope_mapping('<leader>gf', 'git_status')
telescope_mapping('<leader>f', 'find_files')
telescope_mapping('<leader>m', 'marks')
telescope_mapping('<leader>r', 'grep_prompt')
telescope_mapping('<leader>d', 'dotfiles')
telescope_mapping('<leader>h', 'help_tags')
telescope_mapping('<leader>ca', 'lsp_code_actions')

-- telescope_mapping('<leader>lg', 'live_grep')

return setmetatable({}, {
  __index = function(_, k)
    if tele[k] then
      return tele[k]
    else
      return builtin[k]
    end
  end
})
