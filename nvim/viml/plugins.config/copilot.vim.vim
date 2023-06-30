" disable default mappings
let g:copilot_no_tab_map = v:true
let g:copilot_max_file_size = 40 * 1024
let g:copilot_filetypes = {
      \ '*': v:true,
      \ }

" remap keys
inoremap <silent><script><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : copilot#Accept("\<CR>")
inoremap <silent> <C-l> <Plug>(copilot-next)
inoremap <silent> <C-h> <Plug>(copilot-previous)
