" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

scriptencoding utf-8

"初始化备份文件夹
function! UserFuncInitDir()
  let l:parent = $HOME . '/.vimbackupfile'
  let l:prefix = 'vim'
  let l:dir_list = {
        \ 'backup': 'backupdir',
        \ 'views': 'viewdir',
        \ 'swap': 'directory',
        \ 'undo': 'undodir'
        \}
  let l:common_dir = l:parent . '/.' . l:prefix

  for [l:dirname, l:settingname] in items(l:dir_list)
    let l:directory = l:common_dir . l:dirname . '/'
    if exists('*mkdir')
      if !isdirectory(l:directory)
        call mkdir(l:directory, 'p', 0755)
      endif
    endif
    if !isdirectory(l:directory)
      echo 'Warning: Unable to create backup directory: ' . l:directory
      echo 'Try: mkdir -p ' . l:directory
    else
      let l:directory = substitute(l:directory, ' ', "\\\\ ", 'g')
      exec 'set ' . l:settingname . '=' . l:directory
    endif
  endfor
endfunction

function IsBackListFiletypes() abort
  if &filetype =~# '\v^(list|coc-explorer|cocactions)$'
    return v:true
  endif
  return v:false
endfunction

"使用绝对行号
function! UserFuncAbsNum()
  if IsBackListFiletypes()
    return
  endif
  if !exists('#goyo')
    set norelativenumber number
  else
    set norelativenumber nonumber
  endif
endfunction

"使用相对行号
function! UserFuncRelNum()
  if IsBackListFiletypes()
    return
  endif
  if !exists('#goyo')
    set relativenumber number
  else
    set norelativenumber nonumber
  endif
endfunction

function! UserFuncJumpLastPos()
  try
    if line("'\"") <= line('$')
      normal! g`"
      return 1
    endif
  catch /.*/
  endtry
endfunction

let s:browsers = {}
let s:browsers['chrome'] = 'open -a Google\ Chrome '
function! UserFuncViewFile()
    exec 'silent !' . s:browsers['chrome'] . expand('%:p')
endfunction

function! UserFuncGetProjectDir()
    return fnamemodify(finddir('.git', fnameescape(expand('%:p:h')) . ';'), ':p:h:h')
endfunction

function! UserFuncDetectFileType() abort
    let l:extension = expand('%:e')
    if l:extension ==# ''
      let l:path = expand('%:p:h')
      if l:path =~# '\v.+-config$'
        set filetype=json
      endif
    endif
    let l:fileName = expand('%')
    if l:fileName ==# '[Document]'
      set nonumber
      set norelativenumber
      set signcolumn=no
      set nocursorline
      set nocursorcolumn
      set colorcolumn=0
    endif
    if l:fileName =~# '\vtsconfig\.json$' || l:fileName =~# '\vjsconfig\.json$'
      set filetype=jsonc
    endif
endfunction
