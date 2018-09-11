if !executable('golangci-lint')
  finish
endif

function! s:SuperLint() abort
  cexpr system('golangci-lint run --enable-all ' . shellescape(expand('%:p:h')))
endfunction

command! -buffer SuperLint call s:SuperLint()
