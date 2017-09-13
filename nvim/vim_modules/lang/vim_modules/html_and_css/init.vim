" closetag {{{
let g:closetag_html_style=1     " html sytle tag matching
autocmd BufRead,BufNewFile *.{String,string} set filetype=html
" }}} closetag

" css complete {{{
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
" }}}

" markdown {{{
autocmd BufRead,BufNewFile *.{md,mkd,markdown,mdown,mkdn,mdwn} set filetype=markdown
" }}} markdown

" markdown-preview {{{
if has('mac')
    let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
elseif has('unix') && !has('mac')
    let g:mkdp_path_to_chrome = "google-chrome"
endif
" }}} markdown-preview
