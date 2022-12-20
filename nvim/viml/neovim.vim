" vim:set et sw=2 ts=2 fdm=marker fdl=1:
" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

scriptencoding utf-8

" use true color
set termguicolors

" transparent background for popupmenu
set pumblend=20

set wildoptions=pum

" autoread latest file
set autoread

" global statusline
if has('nvim-0.7.0')
  set laststatus=3
else
  set laststatus=2
endif

" do not use provider
let g:loaded_node_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0

" guicursor
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175

augroup UserNeo
  autocmd!
  " for autoread
  autocmd FocusGained * :checktime
augroup END
