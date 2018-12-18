let s:patternTable = {
      \ 'jsxRegion': '{/* %s */}'
      \}
let s:selectPattern = ''
let s:temp = ''

function s:detectRegion() abort
  let l:selectPattern = ''
  let l:stack = synstack(line('.'), col('.'))
  if !empty(l:stack)
    for l:name in map(stack, 'synIDattr(v:val, "name")')
      if has_key(s:patternTable, l:name)
        let l:selectPattern = s:patternTable[l:name]
      endif
    endfor
  endif
  if l:selectPattern !=# ''
    let s:selectPattern = l:selectPattern
    let s:temp = &l:commentstring
    let &l:commentstring = l:selectPattern
  else
    let s:selectPattern = ''
    if s:temp !=# ''
      let &l:commentstring = s:temp
    endif
  endif
  Commentary
endfunction

noremap <leader>cc :call <SID>detectRegion()<CR>
