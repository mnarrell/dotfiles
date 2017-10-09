let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }

if executable("rg")
  let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" Normal mode mappings
nnoremap <silent> <Leader>b :Buffers<CR>
" nnoremap <silent> <Leader>c :Commands<CR>
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <Leader>g :Find<Space>
nnoremap <silent> <Leader>t :Tags<CR>

" Insert mode mappings
imap <C-x><C-l> <Plug>(fzf-complete-line)
