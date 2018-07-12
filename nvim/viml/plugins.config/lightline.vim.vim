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
call UserFuncStartLightline()
augroup UserMatchupOffscreen
  autocmd!
  autocmd User MatchupOffscreenEnter call UserFuncClearLightline()
  autocmd User MatchupOffscreenLeave call UserFuncStartLightline()
augroup END
