call plug#begin('~/.vim/plugged')

" Core
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'wincent/loupe'

" Navigation
" Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'markonm/traces.vim'
Plug 'tpope/vim-vinegar'
Plug 'fweep/vim-tabber'
Plug 'majutsushi/tagbar'

" Eyecandy
Plug 'chriskempson/base16-vim'
Plug 'kshenoy/vim-signature'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Text objects
" Plug 'kana/vim-textobj-line'       | Plug 'kana/vim-textobj-user'
Plug 'christoomey/vim-sort-motion' | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'     | Plug 'kana/vim-textobj-user'
Plug 'wellle/targets.vim'

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" Tmux
" Plug 'edkolev/tmuxline.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'tmux-plugins/vim-tmux-focus-events'

" Completion
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

" Linting
Plug 'w0rp/ale'

" Plug 'elzr/vim-json', { 'for': 'json' }
" Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }
" Plug 'mustache/vim-mustache-handlebars'
" Plug 'vim-jp/syntax-vim-ex'

" Syntax
Plug 'chr4/nginx.vim', { 'for': 'nginx' }
Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoUpdateBinaries' }
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
Plug 'vim-pandoc/vim-pandoc', { 'for': 'pandoc' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'pandoc' }

call plug#end()
