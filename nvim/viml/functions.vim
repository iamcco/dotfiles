" vim:set et sw=2 ts=2 fdm=marker fdl=1:
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

"使用绝对行号
function! UserFuncAbsNum()
  if !exists('#goyo')
    set norelativenumber number
  else
    set norelativenumber nonumber
  endif
endfunction

"使用相对行号
function! UserFuncRelNum()
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

function! UserFuncGetFileName()
  let l:filename = expand('%:p')
  " 对于 index.js 特殊处理，如果文件名字是 /xxxx/xxx/xx/index.js 取 xx
  let l:js_index_file_reg = ':s?\v^.*\/(\w+)\/index\.js$?\1?'
  if l:filename =~? '\vindex\.js$'
    let l:filename = fnamemodify(l:filename, l:js_index_file_reg)
  elseif l:filename !=# ''
    let l:filename = fnamemodify(l:filename, ':t')
  else
    let l:filename = '[No Name]'
  endif
  return l:filename
endfunction

function! UserFuncGetInactiveFilename()
  let l:filename = expand('%')
  if l:filename ==# '[Document]'
    return ''
  endif
  return UserFuncGetFileName()
endfunction

function! UserFuncGetLinterWarnings() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  let l:counts = {}
  try
    let l:counts = ale#statusline#Count(bufnr(''))
  catch /.*/
  endtry
  let l:all_errors = get(l:counts, 'error', 0) + get(l:counts, 'style_error', 0)
  let l:all_non_errors = get(l:counts, 'total', 0) - l:all_errors
  let l:all_non_errors = l:all_non_errors + get(info, 'warning', 0)
  return l:all_non_errors == 0 ? '' : printf('%d', l:all_non_errors)
endfunction

function! UserFuncGetLinterErrors() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  let l:counts = {}
  try
    let l:counts = ale#statusline#Count(bufnr(''))
  catch /.*/
  endtry
  let l:all_errors = get(l:counts, 'error', 0) + get(l:counts, 'style_error', 0)
  let l:all_errors = l:all_errors + get(info, 'error', 0)
  return l:all_errors == 0 ? '' : printf('%d', l:all_errors)
endfunction

let s:user_config_blame = ''


let s:browsers = {}
let s:browsers['chrome'] = 'open -a Google\ Chrome '
function! UserFuncViewFile()
    exec 'silent !' . s:browsers['chrome'] . expand('%:p')
endfunction

function! UserFuncMapLoclistQuit()
    if &buftype ==# 'quickfix'
        redir => l:buffers
        silent ls
        redir END

        let l:nr = bufnr('%')
        for l:buf in split(l:buffers, '\n')
            if match(l:buf, '\v^\s*'.l:nr) > -1 && match(l:buf, '\cQuickfix') == -1
                noremap <silent><buffer> q :lclose<CR>
            endif
        endfor
    endif
endfunction

function! UserFuncGetProjectDir()
    return fnamemodify(finddir('.git', fnameescape(expand('%:p:h')) . ';'), ':h')
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
    if l:fileName ==# 'tsconfig.json' || l:fileName ==# 'jsconfig.json'
      set filetype=jsonc
    endif
endfunction

function! UserFuncCocSetup(info)
  if a:info.status ==# 'installed' || a:info.force
    !yarn install
    call coc#util#install_extension(join([
          \ 'coc-word',
          \ 'coc-emoji',
          \ 'coc-ultisnips',
          \ 'coc-tsserver',
          \ 'coc-html',
          \ 'coc-css',
          \ 'coc-json',
          \ 'coc-eslint',
          \ 'coc-tslint',
          \ 'coc-prettier',
          \ 'coc-stylelint',
          \ 'coc-pyls',
          \ 'coc-java',
          \ 'coc-rls',
          \ 'coc-solargraph',
          \ 'coc-vetur',
          \ 'coc-wxml',
          \ 'coc-yaml',
          \ 'coc-highlight',
          \ 'coc-emmet',
          \], ' '))
  elseif a:info.status ==# 'updated'
    !yarn install
    call coc#util#update()
  endif
endfunction
