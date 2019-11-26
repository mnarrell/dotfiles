vnoremap . :normal .<CR>                          " allow the . to execute once for each line of a visual selection
vnoremap Q : '<,'>:normal @q<CR>                  " allow Q to execute the macro in qq over a visual selection

xnoremap <  <gv
xnoremap >  >gv
xnoremap =  >gv

xnoremap il g_o^
onoremap il :normal vil<CR>
xnoremap al $o0
onoremap al :normal val<CR>
