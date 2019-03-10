" let g:gitp_delete_top_sign = '▤'
" let g:gitp_delete_bottom_sign = '▤'
" let g:gitp_delete_top_and_bottom_sign = '▤'
" let g:gitp_add_sign = '■'
" let g:gitp_modify_sign = '▣'
augroup GitPConfig
  autocmd!
  autocmd ColorScheme * highlight! GitPDiffFloat ctermbg=239 guibg=#333333
augroup END

nmap <leader>d <Plug>(git-p-diff-preview)
