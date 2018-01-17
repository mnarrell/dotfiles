set nocompatible
call plug#begin('~/.vim/plugged')

Plug 'wincent/loupe'                            " Better in-file search
Plug 'wincent/terminus'                         " Make terminal VIM work like a real app
Plug 'mhinz/vim-startify'
Plug 'machakann/vim-highlightedyank'

" Core
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neomake/neomake'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
Plug 'majutsushi/tagbar'

" Tmux Integration
Plug 'jgdavey/tslime.vim'                       " Send selected text to a tmux pane
Plug 'keith/tmux.vim', { 'for': 'tmux' }

" Navigation
Plug 'Xuyuanp/nerdtree-git-plugin'  | Plug 'scrooloose/nerdtree'
Plug 'fweep/vim-tabber'
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-gtfo'                      " Open current file in finder or tmux pane
Plug 'mbbill/undotree'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/vim-easy-align'
Plug 'kshenoy/vim-signature'

" Eyecandy
Plug 'chriskempson/base16-vim'
Plug 'edkolev/tmuxline.vim', { 'for': [] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Text objects
Plug 'christoomey/vim-sort-motion'  | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'      | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'        | Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-user'

" Git things
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

" Completion
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

" GO
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
if has('nvim')
  Plug 'zchee/deoplete-go', { 'do': 'make' }
endif

" PostgreSQL
Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }

" JSON
Plug 'elzr/vim-json', { 'for': 'json' }

" Lua
Plug 'xolox/vim-lua-ftplugin', { 'for': 'lua' } | Plug 'xolox/vim-misc'
Plug 'tbastos/vim-lua', { 'for': 'lua' }

" Python
" Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" Plug 'raimon49/requirements.txt.vim', { 'for': 'requirements' }
" if has('nvim')
"   Plug 'zchee/deoplete-jedi', { 'for': 'python' }
" endif

" Docker
Plug 'ekalinin/Dockerfile.vim'

" K8s
Plug 'andrewstuart/vim-kubernetes'
Plug 'mustache/vim-mustache-handlebars'

call plug#end()
