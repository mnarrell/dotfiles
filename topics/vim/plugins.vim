set nocompatible
call plug#begin('~/.vim/plugged')

Plug 'wincent/loupe'                            " Better in-file search
Plug 'wincent/pinnacle'                         " Search highlighting
Plug 'wincent/terminus'                         " Make terminal VIM work like a real app
Plug 'wincent/vim-clipper'                      " Make system clipboard work like a real app
Plug 'christoomey/vim-tmux-navigator'

" Plug 'jgdavey/tslime.vim'                       " Send selected text to a tmux pane

" Core
" Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips'
Plug 'editorconfig/editorconfig-vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" Eyecandy
Plug 'fweep/vim-tabber'
" Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'chriskempson/base16-vim'
Plug 'edkolev/tmuxline.vim', { 'for': [] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Text objects
Plug 'christoomey/vim-sort-motion'  | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'      | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'        | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-user'

" Git things
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

" Syntax
" Plug 'darfink/vim-plist'
" Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }
" Plug 'sukima/xmledit', { 'for': 'xml' }
Plug 'GEverding/vim-hocon', { 'for': 'hocon' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'keith/tmux.vim', { 'for': 'tmux' }

" Completion
Plug 'Shougo/deoplete.nvim'

" GO
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'zchee/deoplete-go', { 'do': 'make' }

" PostgreSQL
Plug 'lifepillar/pgsql.vim', { 'for': 'sql' }

" Lua
Plug 'xolox/vim-lua-ftplugin', { 'for': 'lua' }
Plug 'xolox/vim-lua-inspect', { 'for': 'lua' }

" Python
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'raimon49/requirements.txt.vim', { 'for': 'requirements' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }

" Docker
Plug 'ekalinin/Dockerfile.vim'

call plug#end()
