setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix

setlocal equalprg=yapf
setlocal formatprg=yapf

hi SpellCap ctermbg=NONE

nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<cr>
nnoremap <buffer> <silent> <C-]> :call LanguageClient#textDocument_definition()<cr>
nnoremap <buffer> <silent> <C-t> <C-o>
nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
nnoremap <buffer> <silent> <C-x><C-o> :call LanguageClient_textDocument_documentSymbol()<cr>
