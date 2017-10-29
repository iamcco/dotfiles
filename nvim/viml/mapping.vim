" vim:set et sw=2 ts=2 fdm=marker fdl=1:
" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

scriptencoding utf-8

" map leader key {{{
let mapleader = ','
let g:mapleader = ','
let maplocalleader = '_'
" }}} map leader key

" open file with browsers {{{
noremap <leader>go :call UserFuncViewFile()<CR>
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
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l
"nmap <silent> <C-k> :exec 'resize ' . (winheight(0) + 1)<CR>
"nmap <silent> <C-j> :exec 'resize ' . (winheight(0) - 1)<CR>
"nmap <silent> <C-h> :exec 'vertical resize ' . (winheight(0) + 1)<CR>
"nmap <silent> <C-l> :exec 'vertical resize ' . (winheight(0) - 1)<CR>
" }}} move in split windows

" select all {{{
map <Leader>sa ggVG
" }}} select all

" words move {{{
cnoremap <C-h> <S-Left>
cnoremap <C-l> <S-Right>
vnoremap <silent> <C-j> :m '>+1<CR>gv=gv
vnoremap <silent> <C-k> :m '<-2<CR>gv=gv
" }}} words move
