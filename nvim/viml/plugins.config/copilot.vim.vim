" disable default mappings
let g:copilot_no_tab_map = v:true
let g:copilot_max_file_size = 40 * 1024
let g:copilot_filetypes = {
      \ '*': v:true,
      \ }

" remap keys
" <c-f> to scroll down if there is no suggestion
inoremap <silent><script><expr> <c-f> empty(copilot#GetDisplayedSuggestion().text) ? coc#float#scroll(1) : copilot#Accept("")
inoremap <silent> <C-l> <Plug>(copilot-next)
inoremap <silent> <C-h> <Plug>(copilot-previous)
