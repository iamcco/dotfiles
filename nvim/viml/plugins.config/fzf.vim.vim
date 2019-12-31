" Fzf previx
let g:fzf_command_prefix = 'Fzf'

let g:fzf_files_options='--preview-window down:wrap --reverse'
let g:fzf_layout = { 'window': 'call OpenFloatWinow()' }

function! OpenFloatWinow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(buf, 0, -1, v:true, lines)
    let s:bwin = nvim_open_win(buf, v:true, opts)
    set winhl=Normal:Comment
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)

    setlocal
          \ buftype=nofile
          \ nobuflisted
          \ bufhidden=hide
          \ nonumber
          \ norelativenumber
          \ signcolumn=no

    augroup AuFzfCenterWin
      autocmd!
      autocmd BufLeave \v[0-9]+;#FZF$ ++once call nvim_win_close(s:bwin, v:true)
      autocmd TermClose \v[0-9]+;#FZF$ ++once call nvim_win_close(s:bwin, v:true)
    augroup END
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

command! -bang -nargs=? -complete=dir FzfFiles
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('down:50%', '?'), <bang>0)
