set completeopt=noinsert,menuone,noselect
inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

augroup CocActionMapping
    autocmd!
    autocmd FileType javascript noremap <buffer> <silent> <C-]> :call CocAction('jumpDefinition')<CR>
    autocmd FileType jsx noremap <buffer> <silent> <C-]> :call CocAction('jumpDefinition')<CR>
    autocmd FileType javascript.jsx noremap <buffer> <silent> <C-]> :call CocAction('jumpDefinition')<CR>
augroup END

