let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \   'left': [
            \             ['mode', 'paste'],
            \             ['readonly', 'activeFilename', 'gitDiffInfo', 'charvaluehex', 'modified']
            \           ],
            \   'right': [
            \              ['linter_errors', 'linter_warnings', 'lineinfo'],
            \              ['percent'],
            \              ['filetype']
            \            ]
            \ },
            \ 'component': {
            \   'charvaluehex': '0x%B',
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
            \ }

augroup Lightline_user
    autocmd!
    autocmd User CocDiagnosticChange call s:update_light_line()
    autocmd User GitPDiffAndBlameUpdate call s:update_light_line()
augroup END

function! s:update_light_line() abort
    try
        call lightline#update()
    catch /.*/
    endtry
endfunction

function! UserFuncGitDiffInfo() abort
  let l:info = ''
  if exists('b:gitp_diff_state')
    let l:info = '%<%{"+' . b:gitp_diff_state['add'] . ' -' . b:gitp_diff_state['delete'] . ' ~' . b:gitp_diff_state['modify'] . '"}'
  endif
  return l:info
endfunction
