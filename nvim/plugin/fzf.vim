" CTRL-A CTRL-Q to select all and build quickfix list

function! s:build_quickfix_list(lines) abort
  " vint: -ProhibitUnnecessaryDoubleQuote
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  " vint: +ProhibitUnnecessaryDoubleQuote
  copen
  cc
endfunction

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }

if executable('rg')
  nnoremap <localleader> :Rg<Space>
endif

nnoremap <silent> <Leader>b :Buffers<CR>
" nnoremap <silent> <Leader>c :Commands<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>h :Helptags<CR>
nnoremap <silent> <Leader>m :Marks<CR>
nnoremap <silent> <Leader>gf :GFiles?<CR>
nnoremap <silent> <Leader>t :Tags<CR>

" Better command history with q:
nnoremap q: :History:<CR>
" Better search history
nnoremap q/ :History/<CR>

" Is this any good?
" imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)


let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

