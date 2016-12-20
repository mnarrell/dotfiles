" Split creating.  I dont know if this is really useful?  Just :(v)sp and move
" with <leader>ww
nmap <leader><left> :leftabove vsp<CR>
nmap <leader><right> :rightbelow vsp<CR>
nmap <leader><up> :leftabove sp<CR>
nmap <leader><down> :rightbelow sp<CR>

" Create new line without entering insert mode
map <Leader>o o<ESC>
map <Leader>O O<ESC>

" Zap trailing whitespace in the current buffer.
nnoremap <silent> <Leader>zz :call mappings#leader#zap()<CR>

nnoremap <Leader>o :only<CR>
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>w :write<CR>
nnoremap <Leader>x :xit<CR>

" <Leader>r -- Cycle through relativenumber + number, number (only), and no
" numbering (mnemonic: relative).
nnoremap <silent> <Leader>r :call mappings#leader#cycle_numbering()<CR>