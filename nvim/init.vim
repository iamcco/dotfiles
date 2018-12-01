" vim:set et sw=2 ts=2 fdm=marker fdl=1:
" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

scriptencoding utf-8

let s:script_path = expand('<sfile>:p:h')

if exists('veonim')
  execute 'source ' . s:script_path . '/veonim.vim'
else
  let s:sourceList = [
        \ 'functions',
        \ 'plugins',
        \ 'commands',
        \ 'general',
        \ 'autocmds',
        \ 'mapping',
        \ 'neovim',
        \ 'plugins.config',
        \ 'style',
        \]
  for s:item in s:sourceList
    exec 'source ' . s:script_path . '/viml/' . s:item . '.vim'
  endfor

  " Free memory
  unlet s:script_path
  unlet s:sourceList

  "let $NVIM_MKDP_LOG_FILE = './log.log'
  "let $NVIM_MKDP_LOG_LEVEL = 'debug'
endif
