local telescope = require('telescope')
local actions = require('telescope.actions')
local finders = require('telescope.finders')
local previewers = require('telescope.previewers')
local pickers = require('telescope.pickers')
local conf = require('telescope.config').values
local builtin = require('telescope.builtin')
local ext = require('telescope').extensions
-- local sorters = require('telescope.sorters')
-- local utils = require('telescope.utils')

telescope.load_extension('fzy_native')

telescope.setup {
  defaults = {
    mappings = {
      i = {['<C-x>'] = false, ['<C-s>'] = actions.goto_file_selection_split}
    },
  },
  file_previewer = previewers.vim_buffer_cat.new,
  grep_previewer = previewers.vim_buffer_vimgrep.new,
  qflist_previewer = previewers.vim_buffer_qflist.new,
  extensions = {
    fzf_writer = {
      minimum_grep_characters = 2,
      minimum_files_characters = 2,
      use_highlighter = true,
    },
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

-- let g:rg_command = '
--   \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
--   \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
--   \ -g "!{.git,node_modules,vendor}/*" '

local tele = {}

function tele.buffers() builtin.buffers {} end
function tele.marks() builtin.marks {} end
function tele.live_grep() builtin.live_grep {} end
-- function tele.find_files() builtin.find_files {} end
function tele.find_files() ext.fzf_writer.files() end

function tele.git_files()
  local opts = {
    cwd = string.gsub(vim.fn.system('git rev-parse --show-toplevel'), '[\n\r]+', ''),
  }

  pickers.new(opts, {
    prompt_title = 'Git Files',
    finder = finders.new_oneshot_job({'git_files'}, opts),
    -- previewer = previewers.cat.new(opts),
    previewer = previewers.vim_buffer_cat.new(opts),
    sorter = conf.file_sorter(opts)
  }):find()
end

function tele.dotfiles()
  builtin.find_files {prompt_title = '~ dotfiles ~', cwd = '~/.dotfiles'}
end

function tele.help_tags()
  builtin.help_tags {show_version = true}
end

setmetatable(tele, {
  __index = function(_, k)
    if tele[k] then
      return tele[k]
    else
      return builtin[k]
    end
  end
})

local function telescope_mapping(key, target)
  vim.api.nvim_set_keymap('n', key, string.format(
  [[<cmd>lua require('plugins.telescope')['%s']()<CR>]],
  target), {noremap = true, silent = true})
end

telescope_mapping('<leader>b', 'buffers')
telescope_mapping('<leader>gf', 'git_files')
telescope_mapping('<leader>f', 'find_files')
telescope_mapping('<leader>m', 'marks')
telescope_mapping('<leader>r', 'live_grep')
telescope_mapping('<leader>d', 'dotfiles')
telescope_mapping('<leader>h', 'help_tags')

local keymap_opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<leader>pf',
"<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<CR>",
keymap_opts)

return tele
