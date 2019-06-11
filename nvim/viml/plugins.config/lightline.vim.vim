let g:lightline = {
            \ 'separator': { 'left': "\ue0b4", 'right': "\ue0b6" },
            \ 'subseparator': { 'left': "", 'right': "" },
            \ 'tabline_separator': { 'left': "\ue0b4", 'right': "\ue0b6" },
            \ 'tabline_subseparator': { 'left': "", 'right': "" },
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \   'left': [
            \             ['mode', 'paste'],
            \             ['readonly', 'gitDiffInfo', 'charvaluehex', 'modified'],
            \             ['activeFilename']
            \           ],
            \   'right': [
            \              ['linter_errors', 'linter_warnings', 'lineinfo'],
            \              ['percent'],
            \              ['filetype']
            \            ]
            \ },
            \ 'component': {
            \   'charvaluehex': '0x%-2B',
            \   'vim_logo': "\ue7c5"
            \ },
            \ 'component_expand': {
            \   'activeFilename': 'UserFuncGetFileName',
            \   'gitDiffInfo': 'UserFuncGitDiffInfo',
            \   'linter_warnings': 'UserFuncGetLinterWarnings',
            \   'linter_errors': 'UserFuncGetLinterErrors',
            \ },
            \ 'component_type': {
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error'
            \ },
            \ 'tabline': {
            \   'left': [ [ 'vim_logo', 'tabs' ] ],
            \   'right': [],
            \ },
            \}

augroup Lightline_user
    autocmd!
    autocmd User CocDiagnosticChange call s:update_light_line()
    autocmd User CocGitStatusChange call s:update_light_line()
augroup END

function! s:update_light_line() abort
    try
        call lightline#update()
    catch /.*/
    endtry
endfunction

function! UserFuncGitDiffInfo() abort
  let l:diff = get(b:, 'coc_git_status', '') !=# ''
        \ ? ' ' . trim(b:coc_git_status)
        \ : ''
  return '%<%{"'
        \. get(g:, 'coc_git_status', '')
        \. l:diff
        \. '"}'
endfunction
