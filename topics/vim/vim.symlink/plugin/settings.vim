set autoread                          " Load buffers modified outside of VIM
set backspace=indent,eol,start        " Make the backspace key sane
set diffopt+=vertical                 " Always use vertical diffs
set encoding=utf-8                    " Default character encoding
set ff=unix                           " UNIX EOL characters
set hidden                            " allow for unsaved buffers in the background
set nocompatible                      " VIM only, don't regress to VI
set nocursorline                      " Highlight the entire line the cursor is on
set nojoinspaces                      " Use one space, not two, after punctuation.
set noshowmode                        " Don't show mode (because of airline)
set nowrap                            " Do not wrap lines by default
set number                            " Show the current line number in the gutter
set showmatch                         " Show matching braces, parens, etc.
set switchbuf=usetab                  " try to reuse windows/tabs when switching buffers
set textwidth=120                     " 80 is for the weak
set undolevels=1000                   " Undo memory size
set updatecount=80                    " update swapfiles every 80 typed chars
set updatetime=2000                   " same as YCM
set visualbell t_vb=                  " stop annoying beeping for non-error errors
set whichwrap=b,h,l,s,<,>,[,],~       " allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
set wildcharm=<C-z>                   " substitute for 'wildchar' (<Tab>) in macros

set autoindent                        " Retain indents when moving to new line
set copyindent                        " Copy the structure of the indent
set expandtab                         " Insert spaces as the tab characters
set scrolloff=3                       " start scrolling 3 lines before edge of viewport
set shiftround                        " always indent by multiple of shiftwidth
set shiftwidth=2                      " spaces per tab (when shifting)
set sidescrolloff=3                   " same as scrolloff, but for columns
set smartindent                       " Intelligently indent based on syntax
set smarttab                          " <tab>/<BS> indent/dedent in leading whitespace

set list                              " show whitespace
set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7) BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)
set nojoinspaces                      " don't autoinsert two spaces after '.', '?', '!' for join command
set number                            " show line numbers in gutter

set shortmess+=A                      " ignore annoying swapfile messages
set shortmess+=I                      " no splash screen
set shortmess+=O                      " file-read message overwrites previous
set shortmess+=T                      " truncate non-file messages in middle
set shortmess+=W                      " don't echo "[w]"/"[written]" when writing
set shortmess+=a                      " use abbreviations in messages eg. `[RO]` instead of `[readonly]`
set shortmess+=o                      " overwrite file-written messages
set shortmess+=t                      " truncate file messages at start

if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

if exists('&belloff')
  set belloff=all                     " never ring the bell for any reason
endif

if has('linebreak')
  set linebreak                       " wrap long lines at characters in 'breakat'
endif

if exists('+relativenumber')
  set relativenumber                  " show relative numbers in gutter
endif

if has('linebreak')
  let &showbreak='↳ '                 " DOWNWARDS ARROW WITH TIP RIGHTWARDS (U+21B3, UTF-8: E2 86 B3)
endif

if has('showcmd')
  set noshowcmd                       " don't show extra info at end of command line
endif

if v:progname !=# 'vi'
  set softtabstop=-1                  " use 'shiftwidth' for tab/bs at end of line
endif
set tabstop=2                         " spaces per tab

if has('syntax')
  set spellcapcheck=                  " don't check for capital letters at start of sentence
endif

if has('windows')
  set splitbelow                      " open horizontal splits below current window
endif

if has('vertsplit')
  set splitright                      " open vertical splits to the right of the current window
endif

if has('virtualedit')
  set virtualedit=block               " allow cursor to move where there is no text in visual block mode
endif

if has('wildignore')
  set wildignore+=*/.git             " patterns to ignore during file-navigation
  set wildignore+=*/tmp/backup
  set wildignore+=*/tmp/swap
endif

if has('wildmenu')
  set wildmenu                        " show options as list when switching buffers etc
endif
set wildmode=longest:full,full        " shell-like autocomplete to unambiguous portion

" Backup/Swap/etc *****************************************************************************************************
set backup
if exists('$SUDO_USER')
  set nobackup                        " don't create root-owned files
  set nowritebackup                   " don't create root-owned files
else
  set backupdir=~/.vim/tmp/backup    " keep backup files out of the way
  set backupdir+=.
endif

if has('persistent_undo')
  if exists('$SUDO_USER')
    set noundofile                    " don't create root-owned files
 else
    set undodir=~/.vim/tmp/undo      " keep undo files out of the way
    set undodir+=.
    set undofile                      " actually use undo files
  endif
endif

if has('viminfo')
  if exists('$SUDO_USER')
    set viminfo=                      " don't create root-owned files
  else
    set viminfo+=n~/.vim/tmp/viminfo  " override ~/.viminfo default

    if !empty(glob('~/.vim/tmp/viminfo'))
      if !filereadable(expand('~/.vim/tmp/viminfo'))
        echoerr 'warning: ~/.vim/tmp/viminfo exists but is not readable'
      endif
    endif
  endif
endif

if has('mksession')
  if isdirectory('~/.vim/tmp')
    set viewdir=~/.vim/tmp/view       " override ~/.vim/view default
  endif
  set viewoptions=cursor,folds        " save/restore just these (with `:{mk,load}view`)
endif

if exists('$SUDO_USER')
  set noswapfile                      " don't create root-owned files
else
  set directory=~/.vim/tmp/swap//    " keep swap files out of the way
  set directory+=.
endif

