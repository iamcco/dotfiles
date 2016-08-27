" neovim config {{{
let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" delete the buffer when exit terminal
au TermClose * bd!
" use ture color
set termguicolors
" }}} neovim config

" vim:set et sw=4 ts=4 fdm=marker fdl=1:
