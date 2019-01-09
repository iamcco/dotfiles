" if hidden not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=1
" always show signcolumns
set signcolumn=yes
" for showSignatureHelp
set noshowmode
set completeopt=noinsert,menuone,noselect

let g:coc_auto_copen = 0

" use <tab> for trigger completion and navigate next complete item
function! s:check_back_space() abort
  let l:col = col('.') - 1
  return !l:col || getline('.')[l:col - 1]  =~# '\s'
endfunction

" tab:
"   1. select autocomplete
"   2. trigger autocomplete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" expand snippets
inoremap <silent> <C-Space> <C-R>=UltiSnips#ExpandSnippet()<CR>
" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:show_documentation()
  if &filetype ==# 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for format selected region
vmap <leader>fm <Plug>(coc-format-selected)
nmap <leader>fm <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

augroup coc_au
  autocmd!
  " Or use formatexpr for range format
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Show signature help while editing
  " autocmd CursorHoldI * silent! call CocActionAsync('showSignatureHelp')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " use denite to open quickfix
  autocmd User CocQuickfixChange :Denite -mode=normal quickfix
augroup END

function! s:snippet() abort
    let l:start_line = line('.')
    let l:is_position = search('\v%x0')
    if l:is_position !=# 0
        silent! s/\v\t/    /g
        silent! s/\v%x0\n//g
        silent! s/\v%x0/\r/g
        let l:end_line = line('.')
        call cursor(l:start_line, 0)
        let l:pos = searchpos('\v\$\{\d+\}', 'n', l:end_line)
        if l:pos[0] !=# 0 && l:pos[1] !=# 0
            call cursor(l:pos[0], l:pos[1])
            normal! df}
        endif
    endif
endfunction

augroup CocSnippet
    autocmd!
    autocmd CompleteDone *.vue call <SID>snippet()
    " highlight text color
    autocmd ColorScheme * highlight! CocHighlightText  guibg=#707e0a ctermbg=023
augroup END
