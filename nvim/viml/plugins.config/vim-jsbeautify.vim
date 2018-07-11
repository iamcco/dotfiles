let g:html_indent_inctags = 'html,body,head,tbody'
let g:html_indent_script1 = 'inc'
let g:html_indent_style1 = 'inc'
let g:vim_json_syntax_conceal = 0
" TODO
autocmd FileType javascript noremap <buffer>  <leader>sf :call JsBeautify()<cr>
autocmd FileType javascript vnoremap <buffer> <leader>sf :call RangeJsBeautify()<cr>
autocmd FileType html noremap <buffer> <leader>sf :call HtmlBeautify()<cr>
autocmd FileType html vnoremap <buffer> <leader>sf :call RangeHtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <leader>sf :call CSSBeautify()<cr>
autocmd FileType css vnoremap <buffer> <leader>sf :call RangeCSSBeautify()<cr>
autocmd FileType json noremap <buffer> <leader>sf :call JsonBeautify()<cr>
autocmd FileType json vnoremap <buffer> <leader>sf :call RangeJsonBeautify()<cr>
