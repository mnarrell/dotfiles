" Status line **********************************************************************************************************
set laststatus=2

function Position() abort
  return '[' . col('.') . ':' . line('.') . ']'
endfunction

call airline#parts#define_function('pos', 'Position')
call airline#parts#define_accent('pos', 'none')

let g:airline_section_y = ''
let g:airline_section_z = airline#section#create_right(['pos'])

let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'
" let g:airline_right_sep=''

let g:airline_extensions = ['branch', 'whitespace', 'ale', 'fugitiveline', 'quickfix', 'keymap']
" let g:airline_extensions = ['branch', 'whitespace', 'ale', 'fugitiveline', 'fzf', 'hunks', 'keymap', 'localsearch', 'nvim-lsp', 'quickfix', 'tagbar']
" let g:airline_extensions = ['branch', 'whitespace', 'ale']
if exists(':Tmuxline')
  let g:airline_extensions += 'tmuxline'
endif

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
      \ ''   : 'S',
      \ 't'  : 'T',
      \ 'v'  : 'V',
      \ 'V'  : 'V'
      \ }

function s:SID()
  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_SID$')
endfunction

function s:goStatusline()
  if !exists('*go#statusline#Show')
    return ''
  endif

  return go#statusline#Show()
endfunction

let s:gsl = '<SNR>' . s:SID() . '_goStatusline'
call airline#parts#define_function('go', s:gsl)
call airline#parts#define_condition('go', '&filetype=="go"')
let g:airline_section_gutter = airline#section#create(['go', '%='])
