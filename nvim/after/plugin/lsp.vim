let g:LanguageClient_rootMarkers = {
      \ 'go': ['.git', 'go.mod', 'Gopkg.toml'],
      \ }

let g:LanguageClient_serverCommands = {
      \ 'sh': ['bash-language-server', 'start'],
      \ 'Dockerfile': ['docker-langserver', '--stdio'],
      \ 'python': ['pyls', '-vv', '--log-file', '~/pyls.log'],
      \ 'vim': ['vim-language-server', '--stdio']
      \ }

let g:LanguageClient_diagnosticsEnable = 0

nnoremap <F5> :call LanguageClient_contextMenu()<CR>

function! SetLSPShortcuts() abort
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  " nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

augroup LSP
  autocmd!
  autocmd FileType python call SetLSPShortcuts()
  autocmd FileType Dockerfile call SetLSPShortcuts()
  autocmd FileType sh call SetLSPShortcuts()
  autocmd FileType vim call SetLSPShortcuts()
augroup END
