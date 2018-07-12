let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
function Multiple_cursors_before()
    let g:deoplete#disable_auto_complete = 1
    call cm#disable_for_buffer()
endfunction
function Multiple_cursors_after()
    let g:deoplete#disable_auto_complete = 0
    call cm#enable_for_buffer()
endfunction
