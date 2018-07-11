" map <C-]> key to jump to definition for javascript
autocmd FileType javascript noremap <buffer> <silent> <C-]> :TernDef<CR>
autocmd FileType jsx noremap <buffer> <silent> <C-]> :TernDef<CR>
autocmd FileType javascript.jsx noremap <buffer> <silent> <C-]> :TernDef<CR>
