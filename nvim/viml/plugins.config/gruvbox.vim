function s:init_sign() abort
  highlight GruvboxRedSign ctermbg=NONE guibg=NONE
  highlight GruvboxGreenSign ctermbg=NONE guibg=NONE
  highlight GruvboxYellowSign ctermbg=NONE guibg=NONE
  highlight GruvboxBlueSign ctermbg=NONE guibg=NONE
  highlight GruvboxPurpleSign ctermbg=NONE guibg=NONE
  highlight GruvboxAquaSign ctermbg=NONE guibg=NONE
endfunction

augroup GruvboxSign
  autocmd!
  autocmd ColorScheme gruvbox call s:init_sign()
augroup END
