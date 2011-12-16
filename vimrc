" Basic de-suck settings
set nocompatible
" set ruler
set laststatus=2
set scrolloff=3
set showcmd
set showmode
set modelines=1
" set number
set shortmess=atI
set visualbell
set autoread

set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set nowrap

syntax on
filetype plugin indent on

color blackboard

" Change <Leader>
let mapleader = ","

" Search
set incsearch
"set ignorecase
set smartcase
set hlsearch

"let g:fuf_autoPreview = 0
"let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|pyc|sw[po])$|(^|[/\\])(\.(hg|git|bzr|egg-info)|build|dist)($|[/\\])'

map <Leader>t :FufTag<CR>
map <Leader>f :FufFile<CR>
map <Leader>F :FufTaggedFile<CR>
map <Leader>b :FufBuffer<CR>
map <Leader>l :FufLine<CR>

nmap <Leader>NL :set invnumber<CR>

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

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
source ~/.vundle

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

" Save a file as root.
cabbrev w!! w !sudo tee % > /dev/null<CR>:e!<CR><CR>

" Quicker filetype setting:
"   :F html
" instead of
"   :set ft=html
" Can tab-complete filetype.
command! -nargs=1 -complete=filetype F set filetype=<args>

" NERDTree
let NERDTreeIgnore=['\.rbc$', '\~$']
let g:NERDMenuMode=0
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>

" NERDCommenter
let g:NERDCreateDefaultMappings=0
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <Esc><plug>NERDCommenterToggle<CR>i

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
