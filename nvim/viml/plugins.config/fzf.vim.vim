" Fzf previx
let g:fzf_command_prefix = 'Fzf'

noremap <silent> <c-p> :FzfFiles<CR>
noremap <silent> <Leader>b :FzfBuffers<CR>

function s:fzf_buf_in() abort
  echo
  set laststatus=0
  set noruler
  set nonumber
  set norelativenumber
  set signcolumn=no
endfunction

function s:fzf_buf_out() abort
  set laststatus=2
  set ruler
endfunction

augroup FzfStateLine
  autocmd!
  autocmd FileType fzf call s:fzf_buf_in()
  autocmd BufEnter \v[0-9]+;#FZF$ call s:fzf_buf_in()
  autocmd BufLeave \v[0-9]+;#FZF$ call s:fzf_buf_out()
  autocmd TermClose \v[0-9]+;#FZF$ call s:fzf_buf_out()
augroup END

command! -bang -nargs=? -complete=dir FzfFiles
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', '?'), <bang>0)

"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* FzfAg
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* FzfRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
