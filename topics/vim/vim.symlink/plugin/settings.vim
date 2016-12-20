" General Behavior ****************************************************************************************************
set autoread                                      " Load buffers modified outside of VIM
set backspace=indent,eol,start                    " Make the backspace key sane
set cursorline                                    " Highlight the entire line the cursor is on
set diffopt+=vertical															" Always use vertical diffs
set encoding=utf-8                                " Default character encoding
set ff=unix                                       " UNIX EOL characters
set hidden                                        " allow for unsaved buffers in the background
set nobackup                                      " Do not make backups
set nocompatible                                  " VIM only, don't regress to VI
set nojoinspaces																  " Use one space, not two, after punctuation.
set noshowmode                                    " Don't show mode (because of airline)
set noswapfile                                    " Do not use swap files
set nowrap                                        " Do not wrap lines by default
set number                                        " Show the current line number in the gutter
set pastetoggle=<F2>                              " Toggle paste mode
set relativenumber                                " Sanity for motions
set ruler                                         " Show the cursor position all the time
set showcmd                                       " Display incomplete commands
set showmatch                                     " Show matching braces, parens, etc.
set undolevels=1000                               " Undo memory size
set visualbell                                    " Use visual bell instead of beeping
set wildignore=*.swp,*.bak,*.pyc,*.class,target   " Ignore these patterns in wildcard matches
set wildmenu                                      " Display all the wildcard matches
set wildmode=list:longest,full                    " Wildcard suggestion modes

" Tab characters  ****************************************************************************************************
set expandtab                                     " Insert spaces as the tab characters
set shiftwidth=2                                  " Default indents are two spaces
set smarttab                                      " Treats tabs as single characters (regardless of expandtab)
set softtabstop=2                                 " Tabs are two spaces
set tabstop=2                                     " Tabs are two spaces

" Indents *************************************************************************************************************
set autoindent                                    " Retain indents when moving to new line
set copyindent                                    " Copy the structure of the indent
set smartindent                                   " Intelligently indent based on syntax

" lorem ipsum this sis just som more dkljfsdoij nedf dfd el ej jw ke kw kc wdl
" Splits ***************************************************************************************************************
" http://technotales.wordpress.com/2010/04/29/vim-splits-a-guide-to-doing-exactly-what-you-want/
set noea
set splitbelow
set splitright

