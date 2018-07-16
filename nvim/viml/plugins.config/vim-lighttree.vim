" detect to open lighttree
function! s:open_light_tree() abort
    let l:file_path = expand('%:p')
    if l:file_path ==# ''
        LightTree
    else
        LightTreeFind
    endif
endfunction

noremap <silent> <leader>e :call <SID>open_light_tree()<CR>
