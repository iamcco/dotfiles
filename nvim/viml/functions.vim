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

function s:isBackListFiletypes() abort
  let l:ft = &filetype
  if l:ft ==# '' || l:ft =~# '\v^(list|coc-explorer|cocactions|any-jump|utools)$'
    return v:true
  endif
  return v:false
endfunction

"使用绝对行号
function! UserFuncAbsNum()
  if s:isBackListFiletypes()
    return
  endif
  if !exists('#goyo')
    setlocal norelativenumber number
  else
    setlocal norelativenumber nonumber
  endif
endfunction

"使用相对行号
function! UserFuncRelNum()
  if s:isBackListFiletypes()
    return
  endif
  if !exists('#goyo')
    setlocal relativenumber number
  else
    setlocal norelativenumber nonumber
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
    if l:fileName =~# '\vtsconfig(\..*)*\.json$' || l:fileName =~# '\vjsconfig(\..*)*\.json$'
      set filetype=jsonc
    endif
endfunction

function! s:buf_total_num()
  return len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
endfunction

function! s:file_size(f)
  let l:size = getfsize(expand(a:f))
  if l:size == 0 || l:size == -1 || l:size == -2
    return ''
  endif
  if l:size < 1024
    return l:size.'bytes'
  elseif l:size < 1024*1024
    return printf('%.1f', l:size/1024.0).'K'
  elseif l:size < 1024*1024*1024
    return printf('%.1f', l:size/1024.0/1024.0) . 'M'
  else
    return printf('%.1f', l:size/1024.0/1024.0/1024.0) . 'G'
  endif
endfunction

function s:current_char_in_hex() abort
    let l:tmp = @a
    normal! v"ay
    let l:res = @a
    let @a = l:tmp
    if l:res ==# "\n"
        let l:res = '\n'
    endif
    return printf(l:res . ':0x%x', char2nr(l:res))
endfunction

" core logic from space-vim
function! UserFuncCtrlG() abort
  redir => file
  :silent f!
  redir END
  let l:msg = [
        \   [substitute(file[2:], '\v"', '', 'g'), 'String'],
        \   ['Cursor:'.line('.').':'.col('.'), 'Type'],
        \   [s:current_char_in_hex(), 'Function'],
        \   [s:file_size(@%), 'Keyword'],
        \   ['TOT:'.s:buf_total_num(), 'Number'],
        \   ['['.&ft.']', 'Label']
        \]
  let l:scp = &l:shortmess
  try
      let l:cpos = getcurpos()
      " The message is truncated
      setlocal shortmess+=T
      for l:item in l:msg
        " use highlight group
        execute 'echohl ' . l:item[1]
        " use echo do not add to message history
        echon l:item[0] . ' '
      endfor
      if l:cpos != getcurpos()
          call setpos('.', l:cpos)
      endif
  finally
      let &l:shortmess = l:scp
      echohl None
  endtry
endfunction
