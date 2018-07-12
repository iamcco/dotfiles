set completeopt=noinsert,menuone,noselect
autocmd BufEnter * call ncm2#enable_for_buffer()
let g:ncm2#matcher = 'abbrfuzzy'
let g:ncm2#sorter = 'abbrfuzzy'
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
