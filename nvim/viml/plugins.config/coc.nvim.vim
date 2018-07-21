set completeopt=noinsert,menu,menuone,noselect
inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let s:action_types = ['jumpDefinition', 'jumpImplementation']
let s:current_action_index = 0

function! s:goto() abort
    if s:current_action_index > len(s:action_types) - 1
        let s:current_action_index = 0
    endif
    call CocAction(get(s:action_types, s:current_action_index, 'jumpDefinition'))
    let s:current_action_index += 1
endfunction

augroup CocActionMapping
    autocmd!
    autocmd FileType javascript noremap <buffer> <silent> <C-]> :call <SID>goto()<CR>
    autocmd FileType jsx noremap <buffer> <silent> <C-]> :call <SID>goto()<CR>
    autocmd FileType javascript.jsx noremap <buffer> <silent> <C-]> :call <SID>goto()<CR>
    autocmd FileType python noremap <buffer> <silent> <C-]> :call <SID>goto()<CR>
augroup END

