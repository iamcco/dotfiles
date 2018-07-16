" vim:set et sw=2 ts=2 fdm=marker fdl=1:
" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

scriptencoding utf-8

"" 设置 GitDiff mark 标记颜色
hi! MyError ctermfg=2 ctermbg=0 guifg=#990000 guibg=#073642
hi! MyWarningMsg ctermfg=2 ctermbg=0 guifg=#999900 guibg=#073642
hi! link ALEErrorSign MyError
hi! link ALEWarningSign MyWarningMsg
hi! MyDiffAdd ctermfg=2 guifg=#719e07 guibg=#073642
hi! MyDiffDelete ctermfg=1 guifg=#dc322f guibg=#073642
hi! MyDiffChange ctermfg=3 guifg=#b58900 guibg=#073642
"hi! MySignMarkText guifg=LightBlue
hi! link GitGutterAdd MyDiffAdd
hi! link GitGutterDelete MyDiffDelete
hi! link GitGutterChange MyDiffChange
hi! link GitGutterChangeDelete MyDiffChange
"hi! link SignatureMarkText MySignMarkText
"hi! link SignColumn   LineNr    " 标记一列的背景颜色
"hi! clear DiffAdd
"hi! clear DiffDelete
"hi! clear DiffChange
