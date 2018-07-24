let g:ale_linters = {
            \ 'javascript': ['eslint'],
            \ 'vue': [],
            \ 'html': ['htmlhint'],
            \ 'markdown': ['markdownlint']
            \ }
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'
let g:ale_fixers = {
      \ 'javascript': [],
      \ 'vue': [],
      \ 'json': []
      \ }
let g:ale_fix_on_save = 1
let g:ale_pattern_options = {'\.min.js$': {'ale_enabled': 0}}
