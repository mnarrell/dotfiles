vim.cmd [[
  augroup ftdetect
    au!

    autocmd FocusLost,WinLeave, * :silent! wa
    autocmd BufWritePre * :call functions#Preserve('%s/\v\s+$//e')
    autocmd VimResized * :wincmd =
    autocmd TermOpen * setlocal nolist nospell noshowmode

    autocmd BufWritePost */mn/plugins.lua PackerCompile

    autocmd BufWinEnter,WinEnter term://* startinsert

    autocmd BufWritePost *.hcl ALEFix
  augroup end
]]
