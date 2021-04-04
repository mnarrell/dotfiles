" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/Users/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/matt/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  ["BetterLua.vim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/BetterLua.vim"
  },
  ale = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.ale\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["ansible-vim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/ansible-vim"
  },
  bufexplorer = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins.bufexplorer\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/bufexplorer"
  },
  ["completion-nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.completion\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  fzf = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.fzf\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.gitsigns\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  loupe = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.loupe\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/loupe"
  },
  ["nginx.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/nginx.vim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.autopairs\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-base16.lua"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.theme\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-base16.lua"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-peekup"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-peekup"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["python-syntax"] = {
    config = { "\27LJ\2\n6\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\25python_highlight_all\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/python-syntax"
  },
  ["quick-scope"] = {
    config = { "\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["requirements.txt.vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/requirements.txt.vim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/startuptime.vim"
  },
  tabular = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/tabular"
  },
  tagbar = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.tagbar\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/tagbar"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope-ultisnips.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/telescope-ultisnips.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["traces.vim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/traces.vim"
  },
  ultisnips = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.ultisnips\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-airline-themes"
  },
  ["vim-commentary"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.commentary\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.fugitive\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-go"] = {
    config = { "\27LJ\2\nå\b\0\0\2\0&\0C6\0\0\0009\0\1\0'\1\3\0=\1\2\0)\1\1\0=\1\4\0)\1\20\0=\1\5\0'\1\a\0=\1\6\0'\1\t\0=\1\b\0)\1\1=\1\n\0)\1\0\0=\1\v\0'\1\r\0=\1\f\0)\1\1\0=\1\14\0)\1\1\0=\1\15\0)\1\1\0=\1\16\0)\1\1\0=\1\17\0)\1\1\0=\1\18\0)\1\1\0=\1\19\0)\1\0\0=\1\20\0)\1\0\0=\1\21\0)\1\1\0=\1\22\0)\1\1\0=\1\23\0)\1\1\0=\1\24\0)\1\1\0=\1\25\0)\1\1\0=\1\26\0)\1\1\0=\1\27\0)\1\1\0=\1\28\0)\1\1\0=\1\29\0)\1\1\0=\1\30\0)\1\0\0=\1\31\0)\1\1\0=\1 \0)\1\1\0=\1!\0)\1\0\0=\1\"\0)\1\1\0=\1#\0)\1\1\0=\1$\0)\1\1\0=\1%\0K\0\1\0'go_highlight_variable_declarations&go_highlight_variable_assignments\23go_highlight_types+go_highlight_trailing_whitespace_error\25go_highlight_structs#go_highlight_string_spellcheck!go_highlight_space_tab_error\27go_highlight_operators\25go_highlight_methods\31go_highlight_generate_tags\27go_highlight_functions%go_highlight_function_parameters go_highlight_function_calls go_highlight_format_strings\24go_highlight_fields\29go_highlight_extra_types%go_highlight_diagnostic_warnings#go_highlight_diagnostic_errors'go_highlight_chan_whitespace_error#go_highlight_build_constraints(go_highlight_array_whitespace_error!go_gopls_complete_unimported\24go_imports_autosave\25go_fmt_fail_silently\ngopls\19go_fmt_command\25go_echo_command_info\18go_updatetime\14ultisnips\22go_snippet_engine\rquickfix\17go_list_type\19go_list_height\24go_doc_popup_window\14camelcase\25go_addtags_transform\6g\bvim\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-go"
  },
  ["vim-helm"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/vim-helm"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-lua-format"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-lua-format"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-scriptease"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-scriptease"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-sort-motion"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-sort-motion"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tabber"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.tabber\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-tabber"
  },
  ["vim-terraform"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.vim-terraform\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-terraform"
  },
  ["vim-textobj-indent"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-textobj-indent"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-tmux"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/vim-tmux"
  },
  ["vim-tmux-focus-events"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-tmux-focus-events"
  },
  ["vim-toml"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/vim-toml"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-vinegar"
  }
}

-- Config for: telescope.nvim
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0", "config", "telescope.nvim")
-- Config for: vim-go
try_loadstring("\27LJ\2\nå\b\0\0\2\0&\0C6\0\0\0009\0\1\0'\1\3\0=\1\2\0)\1\1\0=\1\4\0)\1\20\0=\1\5\0'\1\a\0=\1\6\0'\1\t\0=\1\b\0)\1\1=\1\n\0)\1\0\0=\1\v\0'\1\r\0=\1\f\0)\1\1\0=\1\14\0)\1\1\0=\1\15\0)\1\1\0=\1\16\0)\1\1\0=\1\17\0)\1\1\0=\1\18\0)\1\1\0=\1\19\0)\1\0\0=\1\20\0)\1\0\0=\1\21\0)\1\1\0=\1\22\0)\1\1\0=\1\23\0)\1\1\0=\1\24\0)\1\1\0=\1\25\0)\1\1\0=\1\26\0)\1\1\0=\1\27\0)\1\1\0=\1\28\0)\1\1\0=\1\29\0)\1\1\0=\1\30\0)\1\0\0=\1\31\0)\1\1\0=\1 \0)\1\1\0=\1!\0)\1\0\0=\1\"\0)\1\1\0=\1#\0)\1\1\0=\1$\0)\1\1\0=\1%\0K\0\1\0'go_highlight_variable_declarations&go_highlight_variable_assignments\23go_highlight_types+go_highlight_trailing_whitespace_error\25go_highlight_structs#go_highlight_string_spellcheck!go_highlight_space_tab_error\27go_highlight_operators\25go_highlight_methods\31go_highlight_generate_tags\27go_highlight_functions%go_highlight_function_parameters go_highlight_function_calls go_highlight_format_strings\24go_highlight_fields\29go_highlight_extra_types%go_highlight_diagnostic_warnings#go_highlight_diagnostic_errors'go_highlight_chan_whitespace_error#go_highlight_build_constraints(go_highlight_array_whitespace_error!go_gopls_complete_unimported\24go_imports_autosave\25go_fmt_fail_silently\ngopls\19go_fmt_command\25go_echo_command_info\18go_updatetime\14ultisnips\22go_snippet_engine\rquickfix\17go_list_type\19go_list_height\24go_doc_popup_window\14camelcase\25go_addtags_transform\6g\bvim\0", "config", "vim-go")
-- Config for: ultisnips
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.ultisnips\frequire\0", "config", "ultisnips")
-- Config for: loupe
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.loupe\frequire\0", "config", "loupe")
-- Config for: fzf.vim
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.fzf\frequire\0", "config", "fzf.vim")
-- Config for: ale
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.ale\frequire\0", "config", "ale")
-- Config for: quick-scope
try_loadstring("\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0", "config", "quick-scope")
-- Config for: tagbar
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.tagbar\frequire\0", "config", "tagbar")
-- Config for: vim-tabber
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.tabber\frequire\0", "config", "vim-tabber")
-- Config for: nvim-base16.lua
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.theme\frequire\0", "config", "nvim-base16.lua")
-- Config for: nvim-colorizer.lua
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
-- Config for: vim-commentary
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.commentary\frequire\0", "config", "vim-commentary")
-- Config for: completion-nvim
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.completion\frequire\0", "config", "completion-nvim")
-- Config for: nvim-treesitter
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
-- Config for: bufexplorer
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins.bufexplorer\frequire\0", "config", "bufexplorer")
-- Config for: vim-terraform
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.vim-terraform\frequire\0", "config", "vim-terraform")
-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.autopairs\frequire\0", "config", "nvim-autopairs")
-- Config for: gitsigns.nvim
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.gitsigns\frequire\0", "config", "gitsigns.nvim")
-- Config for: vim-fugitive
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.fugitive\frequire\0", "config", "vim-fugitive")

-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType helm ++once lua require("packer.load")({'vim-helm'}, { ft = "helm" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'python-syntax'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType tmux ++once lua require("packer.load")({'vim-tmux'}, { ft = "tmux" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'vim-toml'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType nginx ++once lua require("packer.load")({'nginx.vim'}, { ft = "nginx" }, _G.packer_plugins)]]
vim.cmd [[au FileType requirements ++once lua require("packer.load")({'requirements.txt.vim'}, { ft = "requirements" }, _G.packer_plugins)]]
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
vim.cmd [[source /Users/matt/.local/share/nvim/site/pack/packer/opt/vim-helm/ftdetect/helm.vim]]
vim.cmd [[source /Users/matt/.local/share/nvim/site/pack/packer/opt/nginx.vim/ftdetect/nginx.vim]]
vim.cmd [[source /Users/matt/.local/share/nvim/site/pack/packer/opt/vim-tmux/ftdetect/tmux.vim]]
vim.cmd [[source /Users/matt/.local/share/nvim/site/pack/packer/opt/requirements.txt.vim/ftdetect/requirements.vim]]
vim.cmd [[source /Users/matt/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
