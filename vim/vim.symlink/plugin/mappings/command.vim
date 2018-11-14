command! PU :call functions#UpdatePlugins()
command! -range=% AsConfluence :call functions#AsConfluence()

command! GX :silent! !gitx
command! RGC :call functions#RestartGocode()
command! PY2 :call functions#SetPython2()
