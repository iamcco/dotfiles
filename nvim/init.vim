" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

" init config {{{

" config util function and variable {{{
let s:init_vim_path = expand('<sfile>:p:h')
function! Load_viml_config(path) abort
    let l:path = s:init_vim_path . '/' . a:path
    if filereadable(l:path)
        exec 'source ' . l:path
    endif
endfunction
" }}} config util function and variable

" neovim setting {{{
if has('nvim')
    call Load_viml_config('viml/neovim.vim')
endif
"}}} neovim setting

" plugins list {{{
call Load_viml_config('viml/plugins.vim')
"}}} plugins list

" general {{{
call Load_viml_config('viml/general.vim')
" }}}

" command {{{
call Load_viml_config('viml/commands.vim')
"}}}

" key mapping {{{
call Load_viml_config('viml/mapping.vim')
" }}}

" plugins config {{{
call Load_viml_config('viml/plugins.config.vim')
" }}}

" }}} init config

" vim:set et sw=4 ts=4 fdm=marker fdl=1:
