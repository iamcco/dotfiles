set completeopt=noinsert,menuone,noselect

" use <tab> for trigger completion and navigate next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

let s:action_types = ['jumpDefinition', 'jumpImplementation']
let s:current_action_index = 0

function! s:goto() abort
    for l:action in s:action_types
        call CocAction(l:action)
    endfor
endfunction

augroup CocActionMapping
    autocmd!
    autocmd FileType javascript noremap <buffer> <silent> <C-]> :call <SID>goto()<CR>
    autocmd FileType jsx noremap <buffer> <silent> <C-]> :call <SID>goto()<CR>
    autocmd FileType javascript.jsx noremap <buffer> <silent> <C-]> :call <SID>goto()<CR>
    autocmd FileType python noremap <buffer> <silent> <C-]> :call <SID>goto()<CR>
augroup END

function! s:snippet() abort
    let l:start_line = line('.')
    let l:is_position = search('\v%x0')
    if l:is_position !=# 0
        silent! s/\v\t/    /g
        silent! s/\v%x0\n//g
        silent! s/\v%x0/\r/g
        let l:end_line = line('.')
        call cursor(l:start_line, 0)
        let l:pos = searchpos('\v\$\{\d+\}', 'n', l:end_line)
        if l:pos[0] !=# 0 && l:pos[1] !=# 0
            call cursor(l:pos[0], l:pos[1])
            normal! df}
        endif
    endif
endfunction

augroup CocVueSnippet
    autocmd!
    autocmd CompleteDone *.vue call <SID>snippet()
augroup END
