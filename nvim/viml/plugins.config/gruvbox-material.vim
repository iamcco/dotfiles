function s:init() abort
  if exists('g:lightline')
    let g:lightline['colorscheme'] = 'gruvbox_material'
  endif
  " virtual text highlight
  highlight! CocCodeLens guifg=#606060 ctermfg=60
  highlight! link SignColumn LineNr
  highlight! Visual guifg=NONE guibg=#484848 guisp=NONE gui=NONE ctermfg=NONE ctermbg=242 cterm=NONE
  highlight! VisualNOS guifg=NONE guibg=#484848 guisp=NONE gui=reverse ctermfg=NONE ctermbg=242 cterm=NONE
  highlight! IncSearch guifg=#f107dd guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  highlight! Search guifg=#f107dd guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
endfunction

augroup ThemeGruvboxMaterial
  autocmd!
  autocmd ColorScheme gruvbox-material call s:init()
augroup END

