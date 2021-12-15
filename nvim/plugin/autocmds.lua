vim.cmd [[
  augroup ftdetect
    au!

    autocmd FocusLost,WinLeave, * :silent! wa
    autocmd BufWritePre * :call functions#Preserve('%s/\v\s+$//e')
    autocmd VimResized * :wincmd =

    autocmd BufWritePost */mn/plugins.lua PackerCompile

    autocmd TermOpen * setlocal nolist nonumber norelativenumber noshowmode nospell
	autocmd TermOpen * startinsert

  augroup end
]]
