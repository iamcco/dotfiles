let g:ale_linters = {
            \ 'javascript': ['eslint'],
            \ 'html': ['htmlhint'],
            \ 'markdown': ['markdownlint']
            \ }
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'
let g:ale_fixers = {
      \ 'javascript': ['eslint']
      \ }
let g:ale_fix_on_save = 1
"
