" vim:set et sw=2 ts=2 fdm=marker fdl=1:
" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

scriptencoding utf-8

" move the cursor to right position {{{
augroup UserAugPos
    autocmd!
    autocmd BufWinEnter * call UserFuncJumpLastPos()
augroup END
"}}} move the cursor to right position

" line number {{{
augroup UserAugLineNumber
    autocmd!
    autocmd FocusLost,InsertEnter * call UserFuncAbsNum()
    autocmd FocusGained,InsertLeave * call UserFuncRelNum()
augroup END
" }}}

" filetype {{{
augroup UserAugFileType
    autocmd!
    autocmd BufRead,BufNewFile *.{md,mkd,markdown,mdown,mkdn,mdwn} set filetype=markdown
    " move cursor to the first line for gitcommit
    autocmd FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
augroup END
" }}}

" mapping {{{
augroup UserAugMapping
    autocmd!
    autocmd! BufWinEnter * call UserFuncMapLoclistQuit()
augroup END
" }}} mapping
