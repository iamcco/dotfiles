" vim:set et sw=2 ts=2 fdm=marker fdl=1:
" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

scriptencoding utf-8

set cursorline
" set cursorcolumn
" set colorcolumn=100
set relativenumber number
set signcolumn=yes
set background=dark

augroup Style_au
  autocmd!
  autocmd ColorScheme * call s:init()
augroup END

function s:init() abort
  highlight! link SignColumn LineNr
  highlight! Visual guifg=NONE guibg=#484848 guisp=NONE gui=NONE ctermfg=NONE ctermbg=242 cterm=NONE
  highlight! VisualNOS guifg=NONE guibg=#484848 guisp=NONE gui=reverse ctermfg=NONE ctermbg=242 cterm=NONE
  highlight! IncSearch guifg=#f107dd guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  highlight! Search guifg=#f107dd guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
endfunction

colorscheme gruvbox-material
