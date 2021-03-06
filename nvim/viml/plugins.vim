" vim:set et sw=2 ts=2 fdm=marker fdl=1:
" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

scriptencoding utf-8

let s:script_path = expand('<sfile>:p:h')

function! s:source(layer) abort
  execute 'source ' . s:script_path . '/layer/' . a:layer . '.vim'
endfunction

call plug#begin(s:script_path . '/plugins')

call s:source('coc')
call s:source('syntax')
call s:source('format')
call s:source('enhance')
call s:source('text-operate')
call s:source('utils')
call s:source('style')

call plug#end()

" Free memory
delfunction s:source
unlet s:script_path
