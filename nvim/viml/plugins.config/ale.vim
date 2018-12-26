scriptencoding utf-8

let g:ale_linters = {
            \ 'typescript': [],
            \ 'typescript.tsx': [],
            \ 'javascript': [],
            \ 'javascript.jsx': [],
            \ 'vue': [],
            \ 'css': [],
            \ 'json': [],
            \ 'markdown': [],
            \ 'html': ['htmlhint'],
            \ 'dart': [],
            \ 'less': [],
            \ 'eruby': [],
            \ }
let g:ale_fixers = {
            \ 'typescript': [],
            \ 'typescript.tsx': [],
            \ 'javascript': [],
            \ 'javascript.jsx': [],
            \ 'vue': [],
            \ 'css': [],
            \ 'json': [],
            \ 'markdown': [],
            \ 'html': [],
            \ 'dart': ['dartfmt'],
            \ }
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'
let g:ale_fix_on_save = 1
let g:ale_pattern_options = {
            \   '\.min.js$': {'ale_enabled': 0}
            \}
