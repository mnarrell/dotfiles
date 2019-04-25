call plug#begin('~/.vim/plugged')


" Core
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'w0rp/ale'
Plug 'wincent/loupe'

" Navigation
" Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'kshenoy/vim-signature'
Plug 'markonm/traces.vim'
Plug 'tpope/vim-vinegar'
Plug 'wellle/targets.vim'
Plug 'fweep/vim-tabber'

" Eyecandy
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-highlightedyank'

" Text objects
Plug 'christoomey/vim-sort-motion' | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'     | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'       | Plug 'kana/vim-textobj-user'

" Git things
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" Completion
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
if has('nvim')
  " Plug 'zchee/deoplete-go', { 'do': 'make'}
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax

" Plug 'vim-jp/syntax-vim-ex'

Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }

" " Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoUpdateBinaries' }
" Plug 'fatih/vim-go', { 'tag': '1.19', 'do': ':GoUpdateBinaries' }

" Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }

" Plug 'elzr/vim-json', { 'for': 'json' }

Plug 'chr4/nginx.vim', { 'for': 'nginx' }

Plug 'vim-pandoc/vim-pandoc', { 'for': 'pandoc' }
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'pandoc' }

" Plug 'edkolev/tmuxline.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
Plug 'tmux-plugins/vim-tmux-focus-events'

" Plug 'mustache/vim-mustache-handlebars'

call plug#end()
