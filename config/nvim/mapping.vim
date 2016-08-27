" key mapping {{{

" map leader key {{{
let mapleader = ','
let g:mapleader = ','
let maplocalleader = '_'
" }}} map leader key

" open file with browsers {{{
let g:browsers = {}
let g:browsers['chrome'] = 'open -a Google\ Chrome '
function! ViewFile()
    exec 'silent !' . g:browsers['chrome'] . expand('%:p')
endfunction
noremap <leader>go :call ViewFile()<CR>
" }}} open file with browsers

" copy to the line end {{{
nnoremap Y y$
" }}} copy to the line end

" no highlight {{{
nmap <silent> <leader>/ :nohlsearch<CR>
" }}} no highlight

" find the conflict line of git {{{
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>
" }}} find the conflict line of git

" move code block {{{
vnoremap < <gv
vnoremap > >gv
" }}} move code block

" repeat operation in visual mode {{{
vnoremap . :normal .<CR>
" }}} repeat operation in visual mode

" list all lines with the word under the cursor {{{
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
" }}} list all lines with the word under the cursor

" move to the left or right {{{
map zl zL
map zh zH
" }}} move to the left or right

" move in split windows {{{
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" }}} move in split windows

" select all {{{
map <Leader>sa ggVG
" }}} select all

" }}} key mapping

" vim:set et sw=4 ts=4 fdm=marker fdl=1:
