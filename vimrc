set nocompatible    " Don't sacrifice anything for Vi compatibility.
set encoding=utf-8  " In case $LANG doesn't have a sensible value.

" pathogem.vim lets us keep plugins etc in their own folders under ~/.vim/bundle.
" http://www.vim.org/scripts/script.php?script_id=2332
" filetype off and then on again afterwards for ftdetect files to work properly.
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on  " Load plugin and indent settings for the detected filetype.
syntax on                  " Syntax highlighting.
color blackboard           " Default color scheme.
set number                 " Show gutter with line numbers.
set ruler                  " Show line, column and scroll info in status line.
set laststatus=2           " Always show status bar.
set modelines=1            " Use modeline overrides.
set showcmd                " Show partially typed command sequences.
set scrolloff=3            " Minimal number of lines to always show above/below the caret.
set autoread 		   " Reload file without prompting

let mapleader = ","

" Tab/shift-Tab or Command-][ to increase/decrease indentation in visual mode.
vmap <Tab> >gv
vmap <S-Tab> <gv
vmap <D-]> >gv
vmap <D-[> <gv

" Save a file as root.
cabbrev w!! w !sudo tee % > /dev/null<CR>:e!<CR><CR>

" Quicker filetype setting:
"   :F html
" instead of
"   :set ft=html
" Can tab-complete filetype.
command! -nargs=1 -complete=filetype F set filetype=<args>

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" NERDTree config
let NERDTreeIgnore=['\.rbc$', '\~$']
let g:NERDMenuMode=0
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>

" NERDCommenter
let g:NERDCreateDefaultMappings=0
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

" Command-T config
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowAtTop=1
