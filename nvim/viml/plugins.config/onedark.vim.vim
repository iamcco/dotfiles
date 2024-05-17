function s:init_dark() abort
  " virtual text highlight
  highlight! CocCodeLens guifg=#556060 ctermfg=60
  highlight! link SignColumn LineNr
  highlight! link NormalFloat Pmenu
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
  " inlay hint
  highlight! CocInlayHint guifg=#606060 ctermfg=60
  highlight! CocInlayHintParameter guifg=#606060 ctermfg=60
  highlight! CocInlayHintType guifg=#606060 ctermfg=60
  " diff sign highlight groups
  highlight! GitAddHi    guifg=#b8bb26 ctermfg=40
  highlight! GitModifyHi guifg=#83a598 ctermfg=33
  highlight! GitDeleteHi guifg=#f3423a ctermfg=196
  " autocomplete menu
  highlight! PmenuSel guibg=#5C6370 ctermbg=59
endfunction

function s:init_light() abort
  " virtual text highlight
  highlight! CocCodeLens guifg=#aa9f9f ctermfg=60
  highlight! link SignColumn LineNr
  highlight! link NormalFloat Pmenu
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
  " inlay hint
  highlight! CocInlayHint guifg=#9f9f9f ctermfg=60
  highlight! CocInlayHintParameter guifg=#9f9f9f ctermfg=60
  highlight! CocInlayHintType guifg=#9f9f9f ctermfg=60
  " diff sign highlight groups
  highlight! GitAddHi    guifg=#1f9d53 ctermfg=40
  highlight! GitModifyHi guifg=#76730c ctermfg=33
  highlight! GitDeleteHi guifg=#f3423a ctermfg=196
  " autocomplete menu
  highlight! PmenuSel guibg=#a39c8f ctermbg=59
  highlight! PmenuThumb guibg=#a39c8f ctermbg=59
  " diff text
  highlight! DiffAdd  guifg=#1f9d53
  highlight! DiffAdded  guifg=#1f9d53
  highlight! DiffChange  guifg=#76730c
  highlight! DiffDelete  guifg=#f3423a
  highlight! DiffRemoved  guifg=#f3423a
endfunction

function! s:init_theme()
  " do not underline error/info/hit lines
  highlight! CocUndercurl cterm=undercurl gui=undercurl
  " do not underline error/info/hit lines
  highlight! link CocErrorHighlight CocUndercurl
  highlight! link CocWarningHighlight CocUndercurl
  highlight! link CocInfoHighlight CocUndercurl
  highlight! link CocHintHighlight CocUndercurl

  " highlight group
  if &background ==# 'dark'
    call s:init_dark()
  else
    call s:init_light()
  endif
endfunction

function! s:get_system_theme() abort
   let l:theme = trim(system(['defaults', 'read', 'Apple Global Domain', 'AppleInterfaceStyle']))
   if l:theme == 'Dark'
     return 'Dark'
   endif
   return 'Light'
endfunction

function! s:update_color_scheme() abort
  if !has('mac')
    return
  endif

  if get(s:, 'update_theme_last_time', 0) != 0 && s:update_theme_last_time == localtime()
    return
  endif
  let s:update_theme_last_time = localtime()

  let l:system_theme = s:get_system_theme()
  if l:system_theme ==# 'Dark' && &background != 'Dark'
    set background=dark
    doautocmd ColorScheme onedark
    redraw
  elseif l:system_theme ==# "Light" && &background != "Light"
    set background=light
    doautocmd ColorScheme onedark
    redraw
  end
endfunction

function! s:change_theme_to(cmd) abort
  let l:system_theme = s:get_system_theme()
  if l:system_theme == a:cmd && &background == a:cmd
    return
  endif
  " use list params to run command directly
  call jobstart(['fish', '-c', 'set -xU THEME ' . a:cmd])
  call jobstart(['kitty', '+kitten', 'themes', '--reload-in=all', a:cmd == 'Dark' ? 'onedark' : 'onelight'])
  call jobstart(['git', 'config', '--global', 'delta.light', a:cmd == 'Dark' ? 'false' : 'true'])
  if l:system_theme != a:cmd
    call system(['osascript', '-e', 'tell app "System Events" to tell appearance preferences to set dark mode to not dark mode'])
  endif
  call s:update_color_scheme()
endfunction

augroup ThemeOneDark
  autocmd!
  autocmd ColorScheme onedark call s:init_theme()
  autocmd Signal SIGUSR1 call s:update_color_scheme()
augroup END

if has('mac')
  command! Dark call s:change_theme_to('Dark')
  command! Light call s:change_theme_to('Light')
endif
