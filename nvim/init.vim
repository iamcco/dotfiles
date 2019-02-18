" vim:set et sw=2 ts=2 fdm=marker fdl=1:
" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

scriptencoding utf-8

let s:script_path = expand('<sfile>:p:h')

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

" let $NVIM_SRAN_LOG_FILE = expand('~/sran-nvim.log')
" let $NVIM_SRAN_LOG_LEVEL = 'debug'
" let $NVIM_MKDP_LOG_FILE = expand('~/log.log')
" let $NVIM_MKDP_LOG_LEVEL = 'debug'
" let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
