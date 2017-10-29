" vim:set et sw=2 ts=2 fdm=marker fdl=1:
" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

" init config {{{
scriptencoding utf-8
let s:initPath = expand('<sfile>:p:h')
let s:sourceList = [
      \ 'plugins',
      \ 'functions',
      \ 'commands',
      \ 'general',
      \ 'autocmds',
      \ 'mapping',
      \ 'lightline',
      \ 'neovim',
      \ 'plugins.config',
      \]
for s:item in s:sourceList
  exec 'source ' . s:initPath . '/viml/' . s:item . '.vim'
endfor
" }}} init config
