command! GX :silent! !gitx
command! PU :call functions#UpdatePlugins()

command! -range=% AsConfluence :call functions#AsConfluence()
command! -range=% Base64Decode :call functions#Base64Decode()

command! -nargs=1 -complete=command Redir silent call functions#Redir(<f-args>)

command! TIG :tabnew | terminal tig -a

command! ClearRegisters call functions#ClearRegisters()
