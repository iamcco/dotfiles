" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

" init config {{{

" neovim setting {{{
if filereadable(expand('<sfile>:p:h') . '/neovim.vim')
    exec "source " . expand('<sfile>:p:h') . "/neovim.vim"
endif
"}}} neovim setting

" plugins list {{{
if filereadable(expand('<sfile>:p:h') . '/plugins.vim')
    exec "source " . expand('<sfile>:p:h') . "/plugins.vim"
endif
"}}} plugins list

" general {{{
if filereadable(expand('<sfile>:p:h') . '/general.vim')
    exec "source " . expand('<sfile>:p:h') . '/general.vim'
endif
" }}}

" command {{{
if filereadable(expand('<sfile>:p:h') . '/commands.vim')
    exec "source " . expand('<sfile>:p:h') . '/commands.vim'
endif
"}}}

" key mapping {{{
if filereadable(expand('<sfile>:p:h') . '/mapping.vim')
    exec "source " . expand('<sfile>:p:h') . '/mapping.vim'
endif
" }}}

" plugins config {{{
if filereadable(expand('<sfile>:p:h') . '/plugins.config.vim')
    exec "source " . expand('<sfile>:p:h') . '/plugins.config.vim'
endif
" }}}

" }}} init config

" vim:set et sw=4 ts=4 fdm=marker fdl=1:
