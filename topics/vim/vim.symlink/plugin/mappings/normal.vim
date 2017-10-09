" " Discipline **********************************************************************************************************
" noremap <silent> <Up> :cprevious<CR>
" noremap <silent> <Down> :cnext<CR>
" noremap <silent> <Left> :cpfile<CR>
" noremap <silent> <Right> :cnfile<CR>

nnoremap Q <nop>
nnoremap K <nop>

" Repeat last macro if in normal buffer.
nnoremap <expr> <CR> empty(&buftype) ? '@@' : '<CR>'

noremap Y y$

" " moving up and down work as you would expect
" nnoremap <silent> j gj
" nnoremap <silent> k gk
" nnoremap <silent> ^ g^
" nnoremap <silent> $ g$

" Split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Store relative line number jumps in the jumplist if they exceed a threshold.
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

" scroll the viewport faster
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" Make Q repeat the last macro.
xnoremap Q : '<,'>:normal @q<CR>

" Create newlines without entering insert mode
nnoremap go o<Esc>k
nnoremap gO O<Esc>j

nnoremap du :diffupdate<CR>

nnoremap =x :call functions#DoPrettyXML()<CR>
nnoremap =j :call functions#PrettyJSON()<CR>
