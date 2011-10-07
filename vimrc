" Basic de-suck settings
set nocompatible
set ruler
set laststatus=2
set scrolloff=3
set showcmd
set showmode
set modelines=1
set number
set shortmess=atI
set visualbell
set autoread

syntax on
filetype plugin indent on

color blackboard

" Change <Leader>
let mapleader = ","

" Search
set incsearch
set ignorecase
set smartcase
set hlsearch

" Tabs & Indenting
set softtabstop=4
set shiftwidth=4
set expandtab

" Catch tabs/trailing spaces
set listchars=tab:▸\ ,trail:·
set list!

" Bash-like filename completion
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.fasl

" Fix backspace
set backspace=indent,eol,start

" Switch buffers without saving
set hidden

" Directories
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Managing splits
" http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/
set noea
nmap <leader><left> :leftabove vsp<CR>
nmap <leader><right> :rightbelow vsp<CR>
nmap <leader><up> :leftabove sp<CR>
nmap <leader><down> :rightbelow sp<CR>

" Swap ` and '
nnoremap ' `
nnoremap ` '

" Fix command typos 
nmap ; :

" Tab/shift-Tab to increase/decrease indentation in visual mode.
vmap <Tab> >gv
vmap <S-Tab> <gv

" Control-up/down to move lines.
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" format JSON
map <leader>j !python -m json.tool<CR>

" Filetype stuff
au FileType make set noexpandtab
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} set ft=markdown
au BufNewFile,BufRead *.json set ft=javascript

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

" PLUGINS

" pathogem.vim to load plugins in ~/.vim/bundle.
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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
