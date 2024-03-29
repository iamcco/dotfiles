" vim:set et sw=2 ts=2 fdm=marker fdl=1:
" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

scriptencoding utf-8

set cursorline
set relativenumber number
set signcolumn=yes

if !exists('g:loaded_color')
  let g:loaded_color = 1
  if $THEME == 'Dark'
    set background=dark
  else
    set background=light
  endif
  colorscheme onedark
endif
