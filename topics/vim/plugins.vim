set nocompatible
call plug#begin('~/.vim/plugged')

" Prerequisites
Plug 'L9'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

Plug 'chriskempson/base16-vim'

" Core
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wesQ3/vim-windowswap'

" Eyecandy
Plug 'corntrace/bufexplorer'
Plug 'fweep/vim-tabber'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Text objects
Plug 'christoomey/vim-sort-motion'
Plug 'elzr/vim-json'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'

" Syntax
Plug 'derekwyatt/vim-scala'
Plug 'lepture/vim-jinja'
Plug 'pearofducks/ansible-vim'
Plug 'scrooloose/syntastic'
Plug 'sukima/xmledit'

" Git things
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-vinegar'

call plug#end()
