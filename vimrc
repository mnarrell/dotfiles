set nocompatible
set encoding=utf-8

" pathogem.vim to load plugins in ~/.vim/bundle.
" filetype off and then on for ftdetect files to work properly.
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

syntax on
color blackboard

set number
set ruler
set laststatus=2
set modelines=1
set showcmd
set scrolloff=3
set autoread
set softtabstop=4
set shiftwidth=4
set expandtab
set listchars=nbsp:·,tab:▸\ ,trail:·
set list!
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set noea

let mapleader = ","

" Tab/shift-Tab to increase/decrease indentation in visual mode.
vmap <Tab> >gv
vmap <S-Tab> <gv

" Move single lines.
nmap <C-Up> [e
nmap <C-Down> ]e
" Move multiple lines.
vmap <C-Up> [egv
vmap <C-Down> ]egv

" format JSON
map <leader>j !python -m json.tool<CR>

"" Create a split on the given side.
" http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/
nmap <leader><left> :leftabove vsp<CR>
nmap <leader><right> :rightbelow vsp<CR>
nmap <leader><up> :leftabove sp<CR>
nmap <leader><down> :rightbelow sp<CR>

" Formatting niceties
" http://vimcasts.org/episodes/tidying-whitespace/
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _+ :call Preserve("normal gg=G")<CR>

" Save a file as root.
cabbrev w!! w !sudo tee % > /dev/null<CR>:e!<CR><CR>

" Quicker filetype setting:
"   :F html
" instead of
"   :set ft=html
" Can tab-complete filetype.
command! -nargs=1 -complete=filetype F set filetype=<args>

" Make use real tabs
au FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown

" add json syntax highlighting
au BufNewFile,BufRead *.json set ft=javascript

" NERDTree
let NERDTreeIgnore=['\.rbc$', '\~$']
let g:NERDMenuMode=0
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>

" NERDCommenter
let g:NERDCreateDefaultMappings=0
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

" Hammer
map <buffer> <leader>p :Hammer<CR>

" Command-T
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowAtTop=1

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" gist-vim
if has("mac")
    let g:gist_clip_command = 'pbcopy'
elseif has("unix")
    let g:gist_clip_command = 'xclip -selection clipboard'
endif
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" ZoomWin
map <Leader><Leader> :ZoomWin<CR>
