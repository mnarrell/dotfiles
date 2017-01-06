" A minimal vimrc for sanity

let mapleader = "\<Space>"
let maplocalleader="\\"

filetype indent plugin on
syntax on

" Settings ************************************************************************************************************
set cursorline                        " Highlight the entire line the cursor is on
set encoding=utf-8                    " Default character encoding
set hidden                            " allow for unsaved buffers in the background
set number                            " Show the current line number in the gutter
set nocompatible                      " VIM only, don't regress to VI
set showmatch                         " Show matching braces, parens, etc.
set autoindent                        " Retain indents when moving to new line
set copyindent                        " Copy the structure of the indent
set smartindent                       " Intelligently indent based on syntax
set expandtab                         " Insert spaces as the tab characters
set undolevels=1000                   " Undo memory size

if exists('+relativenumber')
  set relativenumber                  " show relative numbers in gutter
endif

if has('windows')
  set splitbelow                      " open horizontal splits below current window
endif

if has('vertsplit')
  set splitright                      " open vertical splits to the right of the current window
endif

" Leader mappings *****************************************************************************************************
" Create new line without entering insert mode
map <LocalLeader>o o<ESC>
map <LocalLeader>O O<ESC>

nnoremap <silent> <Leader>o :only<CR>
nnoremap <silent> <Leader>q :quit<CR>
nnoremap <silent> <Leader>w :write<CR>
nnoremap <silent> <Leader>x :xit<CR>

" Normal mappings *****************************************************************************************************
" Discipline
noremap  <Up> ""
" noremap! <Up> <Esc>
noremap  <Down> ""
" noremap! <Down> <Esc>
noremap  <Left> ""
" noremap! <Left> <Esc>
noremap  <Right> ""
" noremap! <Right> <Esc>

nnoremap Q <nop>
nnoremap K <nop>

noremap Y y$

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" Split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" scroll the viewport faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Visual mappings *****************************************************************************************************
vnoremap . :normal .<CR>                          " allow the . to execute once for each line of a visual selection

" vim: set ft=vim:
