call vim_modules#modules#import_plugin('Shougo/deoplete.nvim')
call vim_modules#modules#import_plugin('Shougo/context_filetype.vim')
call vim_modules#modules#import_plugin('Shougo/echodoc.vim')
call vim_modules#modules#import_plugin('Shougo/neco-syntax')
call vim_modules#modules#import_plugin('Shougo/neco-vim')
call vim_modules#modules#import_plugin('zchee/deoplete-jedi')
call vim_modules#modules#import_plugin('carlitux/deoplete-ternjs')

" deoplete {{{
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#auto_complete_delay = 0
""let g:deoplete#max_list = 15
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" }}} deoplete

" echodoc {{{
let g:echodoc_enable_at_startup = 1
set noshowmode
" }}} echodoc

" context_filetype {{{
if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#same_filetypes = {}
endif
let g:context_filetype#same_filetypes.javascript = 'html,string,String'
let g:context_filetype#same_filetypes.html = 'javascript,string,String'
let g:context_filetype#same_filetypes.string = 'javascript,html,String'
let g:context_filetype#same_filetypes.String = 'javascript,html,string'

" }}} context_filetype

" deoplete-ternjs {{{
set completeopt-=preview
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 1
" }}} deoplete-ternjs
