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
  ["base16-vim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.base16\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/base16-vim"
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
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/git-messenger.vim"
  },
  loupe = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.loupe\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/loupe"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.lspsaga\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nginx.vim"] = {
    loaded = false,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/nginx.vim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.autopairs\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-luadev"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-luadev"
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
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
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
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/python-syntax"
  },
  ["quick-scope"] = {
    config = { "\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["requirements.txt.vim"] = {
    loaded = false,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/requirements.txt.vim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
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
  ["telescope-fzf-writer.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/telescope-fzf-writer.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
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
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/vim-helm"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-lion"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-lion"
  },
  ["vim-lua-format"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-lua-format"
  },
  ["vim-peekaboo"] = {
    config = { "\27LJ\2\nI\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\28vertical botright 80new\20peekaboo_window\6g\bvim\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-peekaboo"
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
  ["vim-signify"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.signify\frequire\0" },
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-signify"
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
    path = "/Users/matt/.local/share/nvim/site/pack/packer/opt/vim-tmux"
  },
  ["vim-tmux-focus-events"] = {
    loaded = true,
    path = "/Users/matt/.local/share/nvim/site/pack/packer/start/vim-tmux-focus-events"
  },
  ["vim-toml"] = {
    loaded = false,
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
loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0")()
-- Config for: ultisnips
loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.ultisnips\frequire\0")()
-- Config for: vim-fugitive
loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.fugitive\frequire\0")()
-- Config for: fzf.vim
loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.fzf\frequire\0")()
-- Config for: ale
loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.ale\frequire\0")()
-- Config for: nvim-autopairs
loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.autopairs\frequire\0")()
-- Config for: lspsaga.nvim
loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.lspsaga\frequire\0")()
-- Config for: loupe
loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.loupe\frequire\0")()
-- Config for: vim-terraform
loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.vim-terraform\frequire\0")()
-- Config for: vim-tabber
loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.tabber\frequire\0")()
-- Config for: nvim-treesitter
loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0")()
-- Config for: vim-peekaboo
loadstring("\27LJ\2\nI\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\28vertical botright 80new\20peekaboo_window\6g\bvim\0")()
-- Config for: base16-vim
loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.base16\frequire\0")()
-- Config for: bufexplorer
loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24plugins.bufexplorer\frequire\0")()
-- Config for: quick-scope
loadstring("\27LJ\2\nB\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\6g\bvim\0")()
-- Config for: completion-nvim
loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.completion\frequire\0")()
-- Config for: vim-signify
loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.signify\frequire\0")()
-- Config for: tagbar
loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.tagbar\frequire\0")()
-- Config for: vim-go
loadstring("\27LJ\2\nå\b\0\0\2\0&\0C6\0\0\0009\0\1\0'\1\3\0=\1\2\0)\1\1\0=\1\4\0)\1\20\0=\1\5\0'\1\a\0=\1\6\0'\1\t\0=\1\b\0)\1\1=\1\n\0)\1\0\0=\1\v\0'\1\r\0=\1\f\0)\1\1\0=\1\14\0)\1\1\0=\1\15\0)\1\1\0=\1\16\0)\1\1\0=\1\17\0)\1\1\0=\1\18\0)\1\1\0=\1\19\0)\1\0\0=\1\20\0)\1\0\0=\1\21\0)\1\1\0=\1\22\0)\1\1\0=\1\23\0)\1\1\0=\1\24\0)\1\1\0=\1\25\0)\1\1\0=\1\26\0)\1\1\0=\1\27\0)\1\1\0=\1\28\0)\1\1\0=\1\29\0)\1\1\0=\1\30\0)\1\0\0=\1\31\0)\1\1\0=\1 \0)\1\1\0=\1!\0)\1\0\0=\1\"\0)\1\1\0=\1#\0)\1\1\0=\1$\0)\1\1\0=\1%\0K\0\1\0'go_highlight_variable_declarations&go_highlight_variable_assignments\23go_highlight_types+go_highlight_trailing_whitespace_error\25go_highlight_structs#go_highlight_string_spellcheck!go_highlight_space_tab_error\27go_highlight_operators\25go_highlight_methods\31go_highlight_generate_tags\27go_highlight_functions%go_highlight_function_parameters go_highlight_function_calls go_highlight_format_strings\24go_highlight_fields\29go_highlight_extra_types%go_highlight_diagnostic_warnings#go_highlight_diagnostic_errors'go_highlight_chan_whitespace_error#go_highlight_build_constraints(go_highlight_array_whitespace_error!go_gopls_complete_unimported\24go_imports_autosave\25go_fmt_fail_silently\ngopls\19go_fmt_command\25go_echo_command_info\18go_updatetime\14ultisnips\22go_snippet_engine\rquickfix\17go_list_type\19go_list_height\24go_doc_popup_window\14camelcase\25go_addtags_transform\6g\bvim\0")()
-- Config for: vim-commentary
loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.commentary\frequire\0")()

-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType helm ++once lua require("packer.load")({'vim-helm'}, { ft = "helm" }, _G.packer_plugins)]]
vim.cmd [[au FileType nginx ++once lua require("packer.load")({'nginx.vim'}, { ft = "nginx" }, _G.packer_plugins)]]
vim.cmd [[au FileType requirements ++once lua require("packer.load")({'requirements.txt.vim'}, { ft = "requirements" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'vim-toml'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'python-syntax'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType tmux ++once lua require("packer.load")({'vim-tmux'}, { ft = "tmux" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
