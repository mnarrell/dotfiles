let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

" let $FZF_DEFAULT_COMMAND='ag -g ""'
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow'

if executable("rg")
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)
endif
