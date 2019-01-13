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
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
