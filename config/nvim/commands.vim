" commands {{{

" Find out to which highlight-group a particular keyword/symbol belongs
command! Wcolor echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") .
    \ "> trans<" . synIDattr(synID(line("."),col("."),0),"name") .
    \ "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") .
    \ "> fg:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")

" }}} commands

" vim:set et sw=4 ts=4 fdm=marker fdl=1:
