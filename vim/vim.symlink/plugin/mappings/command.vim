command! PU :call functions#UpdatePlugins()
command! -range=% AsConfluence :call functions#AsConfluence()

command! GX :silent! !gitx

" command! RGC :silent! !killall gocode
command! RGC :call functions#RestartGocode()

command! ToggleMarkbar :execute "normal \<Plug>ToggleMarkbar"
