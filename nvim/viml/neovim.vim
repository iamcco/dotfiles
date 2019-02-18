" vim:set et sw=2 ts=2 fdm=marker fdl=1:
" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

scriptencoding utf-8

" use ture color
set termguicolors

" transparent background for popupmenu
set pumblend=20

" autoread latest file
set autoread

" use sran.nvim instead
let g:loaded_node_provider = 1
if has('mac')
  let g:python_host_prog = expand('~/.pyenv/shims/python')
  let g:python3_host_prog = expand('~/.pyenv/shims/python3')
endif

" guicursor
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175

function s:exit_to_normal() abort
  if &filetype ==# 'fzf'
    return "\<Esc>"
  endif
  return "\<C-\>\<C-n>"
endfunction
tnoremap <expr> <Esc> <SID>exit_to_normal()

augroup UserNeo
  autocmd!
  " delete the buffer when exit terminal
  autocmd TermClose * bd!
  " for autoread
  autocmd FocusGained * :checktime
augroup END
