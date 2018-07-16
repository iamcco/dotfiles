let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ 'active': {
            \   'left': [
            \             ['mode', 'paste'],
            \             ['readonly', 'activeFilename', 'modified'],
            \             ['gitBranchAndBlame']
            \           ],
            \   'right': [
            \              ['linter_errors', 'linter_warnings', 'lineinfo'],
            \              ['percent'],
            \              ['filetype']
            \            ]
            \ },
            \ 'component_expand': {
            \   'activeFilename': 'UserFuncGetFileName',
            \   'gitBranchAndBlame': 'UserFuncGitBranchAndBlame',
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
    autocmd User ALELint call s:update_light_line()
    autocmd User Git_Blame_Update call s:update_light_line()
augroup END

function! s:update_light_line() abort
    if get(s:, 'is_active', v:true)
        call lightline#update()
    endif
endfunction

function! s:deactive() abort
    let s:is_active = v:false
endfunction

function! s:active() abort
    let s:is_active = v:true
endfunction

function! UserFuncGitBranchAndBlame() abort
    let l:branchAndBlame = ''
    let l:branch = fugitive#head()
    if l:branch !=# ''
        let l:branchAndBlame = '%<%{"' . l:branch . '"}'
    endif
    if exists('b:git_blame_current_line')
        let l:branchAndBlame = l:branchAndBlame
                    \. '%{"  / '
                    \. b:git_blame_current_line.date
                    \. ' '
                    \. b:git_blame_current_line.user
                    \. '"}'
    endif
    return l:branchAndBlame
endfunction

augroup UserMatchupOffscreen
  autocmd!
  autocmd User MatchupOffscreenEnter call s:deactive()
  autocmd User MatchupOffscreenLeave call s:active()
augroup END
