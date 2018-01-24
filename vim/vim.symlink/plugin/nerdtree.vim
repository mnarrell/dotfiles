scriptencoding utf-8

let g:NERDTreeHijackNetrw=0

" The default of 31 is just a little too narrow.
let g:NERDTreeWinSize=80

" Disable display of '?' text and 'Bookmarks' label.
let g:NERDTreeMinimalUI=1

let g:NERDTreeIndicatorMapCustom = {
    \ 'Modified'  : '✹',
    \ 'Staged'    : '✚',
    \ 'Untracked' : '✭',
    \ 'Renamed'   : '➜',
    \ 'Unmerged'  : '═',
    \ 'Deleted'   : '✖',
    \ 'Dirty'     : '✗',
    \ 'Clean'     : '✔︎',
    \ 'Unknown'   : '?'
    \ }
