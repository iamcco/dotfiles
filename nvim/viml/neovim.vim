" vim:set et sw=2 ts=2 fdm=marker fdl=1:
" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

scriptencoding utf-8

" neovim config {{{
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

" delete the buffer when exit terminal
au TermClose * bd!

" guicursor
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175

tnoremap <Esc> <C-\><C-n>

" use ture color
set termguicolors
" }}} neovim config
