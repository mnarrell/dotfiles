" Status line **********************************************************************************************************
set laststatus=2

let g:airline_section_z = ''

" let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'
let g:airline_right_sep=''

let g:airline_extensions = ['branch', 'whitespace', 'ale']
if exists(':Tmuxline')
  let g:airline_extensions += 'tmuxline'
endif

" let g:airline#extensions#ale#enabled = 1

let g:airline_mode_map = {
      \ '__' : '-',
      \ 'c'  : 'C',
      \ 'i'  : 'I',
      \ 'ic' : 'I',
      \ 'ix' : 'I',
      \ 'n'  : 'N',
      \ 'ni' : 'N',
      \ 'no' : 'N',
      \ 'R'  : 'R',
      \ 'Rv' : 'R',
      \ 's'  : 'S',
      \ 'S'  : 'S',
      \ '' : 'S',
      \ 't'  : 'T',
      \ 'v'  : 'V',
      \ 'V'  : 'V'
      \ }


let g:tmuxline_powerline_separators = 0
