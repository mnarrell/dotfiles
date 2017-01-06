set nocompatible
call plug#begin('~/.vim/plugged')

" Prerequisites
Plug 'L9'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

Plug 'chriskempson/base16-vim'

Plug 'wincent/command-t', { 'do': 'rake make' } " Fuzzy finder
Plug 'wincent/loupe'                            " Better in-file search
Plug 'wincent/pinnacle'                         " Search highlighting
Plug 'wincent/terminus'                         " Make terminal VIM work like a real app
Plug 'wincent/vim-clipper'                      " Make system clipboard work like a real app

" Core
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wesQ3/vim-windowswap'

" Eyecandy
Plug 'corntrace/bufexplorer'
Plug 'fweep/vim-tabber'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim', { 'on': [] }

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'christoomey/vim-sort-motion'  | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'      | Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'        | Plug 'kana/vim-textobj-user'

" Syntax
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }
Plug 'scrooloose/syntastic'
Plug 'sukima/xmledit', { 'for': 'xml'}
Plug 'keith/tmux.vim'

" Git things
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-vinegar'

call plug#end()
