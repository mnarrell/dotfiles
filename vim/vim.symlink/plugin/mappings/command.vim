command! PU :call functions#UpdatePlugins()
command! -range=% AsConfluence :call functions#AsConfluence()

command! GX :silent! !gitx

command! ToggleMarkbar :execute "normal \<Plug>ToggleMarkbar"
