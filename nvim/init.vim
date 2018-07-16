" vim:set et sw=2 ts=2 fdm=marker fdl=1:
" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

scriptencoding utf-8

let s:script_path = expand('<sfile>:p:h')
let s:sourceList = [
      \ 'plugins',
      \ 'functions',
      \ 'commands',
      \ 'general',
      \ 'autocmds',
      \ 'mapping',
      \ 'style',
      \ 'neovim',
      \ 'plugins.config',
      \]
for s:item in s:sourceList
  exec 'source ' . s:script_path . '/viml/' . s:item . '.vim'
endfor

" Free memory
unlet s:script_path
unlet s:sourceList
