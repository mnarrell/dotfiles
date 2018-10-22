call plug#begin('~/.vim/plugged')

Plug 'wincent/loupe'                            " Better in-file search
Plug 'wincent/terminus'                         " Make terminal VIM work like a real app

" Core
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }

" Navigation
Plug 'Yilin-Yang/vim-markbar'
Plug 'fweep/vim-tabber'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-vinegar'

" Eyecandy
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-highlightedyank'

" Text objects
Plug 'christoomey/vim-sort-motion'  | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'      | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'        | Plug 'kana/vim-textobj-user'

" Git things
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-git'

" " Formatting
" Plug 'sbdchd/neoformat'

" Completion
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax

Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }
if has('nvim')
  Plug 'zchee/deoplete-go', { 'do': 'make' }
endif

Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }

Plug 'elzr/vim-json', { 'for': 'json' }

Plug 'tbastos/vim-lua', { 'for': 'lua' }
Plug 'xolox/vim-lua-ftplugin', { 'for': 'lua' } | Plug 'xolox/vim-misc'

Plug 'chr4/nginx.vim', { 'for': 'nginx' }

Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }

Plug 'vim-pandoc/vim-pandoc', { 'for': 'pandoc' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'pandoc' }

Plug 'edkolev/tmuxline.vim', { 'for': [] }
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }

Plug 'mustache/vim-mustache-handlebars'

Plug 'zchee/deoplete-jedi', { 'for': 'python' }

call plug#end()
