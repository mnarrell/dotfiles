call plug#begin('~/.vim/plugged')

Plug 'wincent/loupe'                            " Better in-file search
" Plug 'wincent/terminus'                         " Make terminal VIM work like a real app

" Core
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'jiangmiao/auto-pairs'
" Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
" Plug 'romainl/vim-qf'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'w0rp/ale'

" Navigation
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
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" Completion
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'do': 'make'}
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax

Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }

Plug 'fatih/vim-go', { 'tag': '*', 'for': 'go', 'do': ':GoUpdateBinaries' }

Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }

Plug 'elzr/vim-json', { 'for': 'json' }

Plug 'chr4/nginx.vim', { 'for': 'nginx' }

Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }

Plug 'vim-pandoc/vim-pandoc', { 'for': 'pandoc' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'pandoc' }

Plug 'edkolev/tmuxline.vim', { 'for': [] }
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'mustache/vim-mustache-handlebars'

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

call plug#end()
