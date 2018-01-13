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
  if line("'\"") <= line('$')
    normal! g`"
    return 1
  endif
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

function! UserFuncGetLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_non_errors == 0 ? '' : printf('%d', l:all_non_errors)
endfunction

function! UserFuncGetLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  return l:all_errors == 0 ? '' : printf('%d', l:all_errors)
endfunction

let s:git_blame_line = 0
let s:user_config_blame = ''

function! UserFuncGitBranchAndBlame() abort
    let l:branchAndBlame = ''
    let l:branch = fugitive#head()
    if l:branch !=# ''
        let l:branchAndBlame = '%<%{"' . l:branch . '"}'
    endif
    if s:user_config_blame !=# ''
        let l:branchAndBlame = l:branchAndBlame . '%{"  / ' . s:user_config_blame . '"}'
    endif
    return l:branchAndBlame
endfunction

function! UserFuncClearTimer() abort
  if exists('g:UserVarHoldLineTimer')
    call timer_stop(g:UserVarHoldLineTimer)
  endif
endfunction

function! UserFuncStartTimer() abort
  let g:UserVarHoldLineTimer = timer_start(500,
        \'UserFuncGetGlame',
        \{ 'repeat': 1 })
endfunction

function! UserFuncGetGlame(...) abort
    let l:blame_info = get(git_blame#get_lines_blame_parse(), '0', {})
    if get(l:blame_info, 'status', v:false)
      let s:user_config_blame = get(l:blame_info, 'date', '') . ' ' . get(l:blame_info, 'user', '')
    else
      let s:user_config_blame = ''
    endif
    call UserFuncUpdateLightline()
endfunction

function! UserFuncUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

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
