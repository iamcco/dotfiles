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
  autocmd ColorScheme * highlight! link SignColumn LineNr
  " diff sign highlight groups
  autocmd ColorScheme * highlight GitAddHi    guifg=#b8bb26 ctermfg=40
  autocmd ColorScheme * highlight GitModifyHi guifg=#83a598 ctermfg=33
  autocmd ColorScheme * highlight GitDeleteHi guifg=#f3423a ctermfg=196
augroup END

colorscheme gruvbox
