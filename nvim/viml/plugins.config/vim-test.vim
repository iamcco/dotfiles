if has('nvim')
  autocmd TermOpen * startinsert
endif

function! TermGg(...) abort
  setl nonu nornu
  nmap <buffer> <cr> :silent! bd!<CR>:tabprevious<CR>
  nmap <buffer> <ESC> :silent! bd!<CR>:tabprevious<CR>
  normal gg
endfunction

function! TermStrategy(cmd)
  tabnew
  if has('nvim')
    call termopen(a:cmd)
    call feedkeys("\<C-\>\<C-n>gg", 'n')
    setl nonu nornu
    nmap <buffer> <cr> :silent! bd!<CR>:tabprevious<CR>
    nmap <buffer> <ESC> :silent! bd!<CR>:tabprevious<CR>
  else
    let l:isWin = has('win32') && fnamemodify(&shell, ':t') ==? 'cmd.exe'
    call term_start(!l:isWin ? ['/bin/sh', '-c', a:cmd] : ['cmd.exe', '/c', a:cmd],
          \ {"exit_cb": {->timer_start(100, function('TermGg'))}, "curwin": v:true })
  endif
endfunction

let g:test#custom_strategies = {'termOpen': function('TermStrategy')}
let g:test#strategy = 'termOpen'
