let g:LanguageClient_rootMarkers = {
        \ 'go': ['.git', 'go.mod', 'Gopkg.toml'],
        \ }

let g:LanguageClient_serverCommands = {
    \ 'go': ['bingo'],
    \ 'sh': ['bash-language-server', 'start'],
    \ 'Dockerfile': ['docker-langserver', '--stdio'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
