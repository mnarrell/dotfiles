set nocompatible
call plug#begin('~/.vim/plugged')

" Prerequisites
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }

Plug 'wincent/loupe'                            " Better in-file search
Plug 'wincent/pinnacle'                         " Search highlighting
Plug 'wincent/terminus'                         " Make terminal VIM work like a real app
Plug 'wincent/vim-clipper'                      " Make system clipboard work like a real app

Plug 'jgdavey/tslime.vim'                       " Send selected text to a tmux pane

" Core
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'neomake/neomake', { 'on': 'Neomake' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" Eyecandy
Plug 'chriskempson/base16-vim'
Plug 'edkolev/tmuxline.vim', { 'for': [] }
Plug 'fweep/vim-tabber'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Text objects
Plug 'bps/vim-textobj-python'
Plug 'christoomey/vim-sort-motion'  | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'      | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'        | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-user'

" Syntax
Plug 'GEverding/vim-hocon', { 'for': 'hocon' }
" Plug 'darfink/vim-plist'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'keith/tmux.vim', { 'for': 'tmux' }
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }
Plug 'roxma/nvim-completion-manager'
Plug 'sukima/xmledit', { 'for': 'xml'}

" Python
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'zchee/deoplete-jedi', { 'do': 'git submodule update --init', 'for': 'python' }

" Git things
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

call plug#end()
