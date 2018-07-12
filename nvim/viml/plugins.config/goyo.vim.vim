function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set nocursorcolumn
  set nocursorline
  Limelight
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=3
  set cursorcolumn
  set cursorline
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
