set completeopt=noinsert,menuone,noselect
inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

