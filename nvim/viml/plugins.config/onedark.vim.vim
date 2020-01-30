function s:init() abort
  " virtual text highlight
  highlight! CocCodeLens guifg=#556060 ctermfg=60
  highlight! link SignColumn LineNr
  highlight! Visual guifg=NONE guibg=#484848 guisp=NONE gui=NONE ctermfg=NONE ctermbg=242 cterm=NONE
  highlight! VisualNOS guifg=NONE guibg=#484848 guisp=NONE gui=reverse ctermfg=NONE ctermbg=242 cterm=NONE
  highlight! IncSearch guifg=#f107dd guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
  highlight! Search guifg=#f107dd guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
endfunction

augroup ThemeOneDark
  autocmd!
  autocmd ColorScheme onedark call s:init()
augroup END

