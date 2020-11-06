scriptencoding utf-8

nnoremap <silent> <Leader>o :only<CR>
nnoremap <silent> <Leader>q :quit<CR>
" nnoremap <silent> <Leader>w :write<CR>
nmap <silent> <Leader>w :<C-u>call functions#SaveAndExec()<CR>
nnoremap <silent> <Leader>x :xit<CR>

" Do the splits
nnoremap <leader>v :vsp<cr>
nnoremap <leader>s :sp<cr>

nnoremap <leader>k :bd!<CR>
