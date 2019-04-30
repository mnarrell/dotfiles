let g:LanguageClient_rootMarkers = {
        \ 'go': ['.git', 'go.mod', 'Gopkg.toml'],
        \ }

let g:LanguageClient_serverCommands = {
    \ 'go': ['gopls'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'Dockerfile': ['docker-langserver', '--stdio'],
    \ }

let g:LanguageClient_diagnosticsEnable = 0

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
