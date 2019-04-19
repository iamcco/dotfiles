" Fzf previx
let g:fzf_command_prefix = 'Fzf'

let g:fzf_layout = { 'window': 'call OpenFloatWinow()' }

function! OpenFloatWinow()
  let height = float2nr(&lines / 3)
  let width = &columns
  let row = &lines - height

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row - 1,
        \ 'col': 0,
        \ 'width': width,
        \ 'height': height
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  " use normal highlight
  call setwinvar(win, '&winhl', 'Normal:Normal')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

augroup FzfStateLine
  autocmd!
  autocmd BufLeave \v[0-9]+;#FZF$ call s:fzf_buf_out()
  autocmd TermClose \v[0-9]+;#FZF$ call s:fzf_buf_out()
augroup END

function! s:fzf_buf_out() abort
  if exists('lightline#update')
    call lightline#update()
  endif
endfunction

noremap <silent> <c-p> :FzfFiles<CR>
noremap <silent> <Leader>b :FzfBuffers<CR>

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
