let s:background = &background

function s:init_before() abort
  " store background before colorscheme init
  let s:background = &background

  if s:background ==# "light"
    let g:onedark_color_overrides = {
          \ "red":            { "gui": "#1f938a", "cterm": "204", "cterm16": "1" },
          \ "dark_red":       { "gui": "#41afb9", "cterm": "196", "cterm16": "9" },
          \ "green":          { "gui": "#673c86", "cterm": "114", "cterm16": "2" },
          \ "yellow":         { "gui": "#1a3f84", "cterm": "180", "cterm16": "3" },
          \ "dark_yellow":    { "gui": "#2e6599", "cterm": "173", "cterm16": "11" },
          \ "blue":           { "gui": "#9e5010", "cterm": "39", "cterm16": "4" },
          \ "purple":         { "gui": "#398722", "cterm": "170", "cterm16": "5" },
          \ "cyan":           { "gui": "#a9493d", "cterm": "38", "cterm16": "6" },
          \ "white":          { "gui": "#544d40", "cterm": "145", "cterm16": "7" },
          \ "black":          { "gui": "#d7d3cb", "cterm": "235", "cterm16": "0" },
          \ "visual_black":   { "gui": "NONE", "cterm": "NONE", "cterm16": "0" },
          \ "comment_grey":   { "gui": "#a39c8f", "cterm": "59", "cterm16": "15" },
          \ "gutter_fg_grey": { "gui": "#b4ad9c", "cterm": "238", "cterm16": "15" },
          \ "cursor_grey":    { "gui": "#d3cdc3", "cterm": "236", "cterm16": "8" },
          \ "visual_grey":    { "gui": "#c1bbad", "cterm": "237", "cterm16": "15" },
          \ "menu_grey":      { "gui": "#c1bbad", "cterm": "237", "cterm16": "8" },
          \ "special_grey":   { "gui": "#c4bfb7", "cterm": "238", "cterm16": "15" },
          \ "vertsplit":      { "gui": "#e7e5e0", "cterm": "59", "cterm16": "15" },
          \}
  endif
endfunction

function s:init_after() abort
  " colorscheme will set background after init
  " here restore background
  let &background = s:background

  " highlight group with different background
  if s:background ==# "light"
    " virtual text highlight
    highlight! CocCodeLens guifg=#aa9f9f ctermfg=60
    highlight! link SignColumn LineNr
    highlight! Visual guifg=NONE guibg=#b7b7b7 guisp=NONE gui=NONE ctermfg=NONE ctermbg=242 cterm=NONE
    highlight! VisualNOS guifg=NONE guibg=#b7b7b7 guisp=NONE gui=reverse ctermfg=NONE ctermbg=242 cterm=NONE
    highlight! IncSearch guifg=NONE guibg=#fab3df guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
    highlight! Search guifg=NONE guibg=#fab3df guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold

    " coc.nvim highlight relative
    " highlight text color
    highlight! CocHighlightText guibg=#fab3df ctermbg=023
    " error/warning/info/hit sign
    highlight! CocErrorSign ctermfg=Red guifg=#ea6962
    highlight! CocWarningSign ctermfg=Yellow guifg=#15969d
    highlight! CocInfoSign ctermfg=Blue guifg=#825164
    highlight! CocHintSign ctermfg=Blue guifg=#825164
    " error/warning/info/hit float window
    highlight! CocErrorFloat ctermfg=Blue guifg=#ea6962
    highlight! CocWarningFloat ctermfg=Yellow guifg=#15969d
    highlight! CocInfoFloat ctermfg=Blue guifg=#825164
    highlight! CocHintFloat ctermfg=Blue guifg=#825164
    " virtual text highlight
    highlight! CocCodeLens guifg=#9f9f9f ctermfg=60
    highlight! CocCursorRange guibg=#4e9d79 guifg=#14244d
    " diff sign highlight groups
    highlight! GitAddHi    guifg=#1f9d53 ctermfg=40
    highlight! GitModifyHi guifg=#76730c ctermfg=33
    highlight! GitDeleteHi guifg=#f3423a ctermfg=196
    " diff text
    highlight! DiffAdd  guifg=#1f9d53
    highlight! DiffAdded  guifg=#1f9d53
    highlight! DiffChange  guifg=#76730c
    highlight! DiffDelete  guifg=#f3423a
    highlight! DiffRemoved  guifg=#f3423a
    " autocomplete menu
    highlight! CocMenuSel guibg=#a39c8f ctermbg=59

    " statusline
    highlight!            StlModeINSERT       guibg=#61afef guifg=#d7d3cb ctermbg=39  ctermfg=235
    highlight!            StlModeVISUAL       guibg=#398722 guifg=#d7d3cb ctermbg=170 ctermfg=235
    highlight!            StlNormalModified   guibg=#c1cbad guifg=#877d70 ctermbg=235 ctermfg=241
    highlight! StlWarning guibg=#e5c07b       guifg=#b7b7b7 ctermbg=180 ctermfg=239
    highlight! StlError   guibg=#e06c75       guifg=#d7d7d7 ctermbg=204 ctermfg=235
  else
    " virtual text highlight
    highlight! CocCodeLens guifg=#556060 ctermfg=60
    highlight! link SignColumn LineNr
    highlight! Visual guifg=NONE guibg=#484848 guisp=NONE gui=NONE ctermfg=NONE ctermbg=242 cterm=NONE
    highlight! VisualNOS guifg=NONE guibg=#484848 guisp=NONE gui=reverse ctermfg=NONE ctermbg=242 cterm=NONE
    highlight! IncSearch guifg=#f107dd guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold
    highlight! Search guifg=#f107dd guibg=NONE guisp=NONE gui=bold ctermfg=NONE ctermbg=NONE cterm=bold

    " coc.nvim highlight relative
    " highlight text color
    highlight! CocHighlightText guibg=#054c20 ctermbg=023
    " error/warning/info/hit sign
    highlight! CocErrorSign ctermfg=Red guifg=#ea6962
    highlight! CocWarningSign ctermfg=Yellow guifg=#e3a84e
    highlight! CocInfoSign ctermfg=Blue guifg=#7dae9b
    highlight! CocHintSign ctermfg=Blue guifg=#7dae9b
    " virtual text highlight
    highlight! CocCodeLens guifg=#606060 ctermfg=60
    highlight! CocCursorRange guibg=#b16286 guifg=#ebdbb2
    " diff sign highlight groups
    highlight! GitAddHi    guifg=#b8bb26 ctermfg=40
    highlight! GitModifyHi guifg=#83a598 ctermfg=33
    highlight! GitDeleteHi guifg=#f3423a ctermfg=196
    " autocomplete menu
    highlight! CocMenuSel guibg=#5C6370 ctermbg=59
    highlight! CocMenuSel guibg=#a39c8f ctermbg=59
  endif
endfunction

augroup ThemeOneDark
  autocmd!
  autocmd ColorSchemePre onedark call s:init_before()
  autocmd ColorScheme onedark call s:init_after()
augroup END

