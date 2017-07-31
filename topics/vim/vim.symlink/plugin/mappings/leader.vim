" Zap trailing whitespace in the current buffer.
nnoremap <silent> <Leader>zz :call mappings#leader#zap()<CR>

nnoremap <silent> <Leader>o :only<CR>
nnoremap <silent> <Leader>q :quit<CR>
nnoremap <silent> <Leader>w :write<CR>
nnoremap <silent> <Leader>x :xit<CR>

" <Leader>r -- Cycle through relativenumber + number, number (only), and no
" numbering (mnemonic: relative).
nnoremap <silent> <Leader>r :call mappings#leader#cycle_numbering()<CR>

nmap <leader>gs :Gstatus<cr>gg<C-n>

" FZF
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>f :Files<CR>
