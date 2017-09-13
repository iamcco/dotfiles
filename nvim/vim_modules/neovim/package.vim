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

" vim:set et sw=4 ts=4 fdm=marker fdl=1:
