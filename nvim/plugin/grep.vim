if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
elseif executable('ag')
  set grepprg=ag\ --vimgrep
endif
