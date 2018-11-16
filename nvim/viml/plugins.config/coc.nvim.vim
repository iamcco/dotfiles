" if hidden not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=1
" always show signcolumns
set signcolumn=yes
" for showSignatureHelp
set noshowmode
set completeopt=noinsert,menuone,noselect

" use <tab> for trigger completion and navigate next complete item
function! s:check_back_space() abort
  let l:col = col('.') - 1
  return !l:col || getline('.')[l:col - 1]  =~# '\s'
endfunction

" if exists snippets
function s:isSnipsExpandable()
    try
        let l:line = getline('.')
        let l:start = col('.') - 1
        while l:start > 0 && l:line[l:start - 1] =~# '\k'
            let l:start -= 1
        endwhile
        let l:trigger = l:line[l:start : col('.')-2]
        " get user input str
        if s:input_word ==# ''
            let s:input_word = l:trigger
        endif
        if s:input_word !=# l:trigger
            return v:false
        endif
        " get snippets
        let l:snippets = UltiSnips#SnippetsInCurrentScope()
        let l:has_snips = !(
                    \ col('.') <= 1
                    \ || !empty(matchstr(getline('.'), '\%' . (col('.') - 1) . 'c\s'))
                    \ || empty(l:snippets)
                    \ || get(l:snippets, l:trigger, 'notExists') ==# 'notExists'
                    \ )
        " has snippets and snippets is input str
        return l:has_snips
    catch /.*/
        return v:false
    endtry
endfunction

" press enter when pumvisible
function! s:press_enter() abort
    if s:input_word ==# ''
        return "\<C-g>u\<CR>\<C-g>u"
    endif
    return "\<C-y>"
endfunction

" tab:
"   1. trigger snippets
"   2. select autocomplete
"   3. trigger autocomplete
inoremap <silent><expr> <TAB>
      \ <SID>isSnipsExpandable() ? "<C-R>=UltiSnips#ExpandSnippet()<CR>" :
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <C-x></C-u> to complete custom sources, including emoji, include and words
imap <silent> <C-x><C-o> <Plug>(coc-complete-custom)
" Use <cr> for confirm completion.
inoremap <expr> <CR> pumvisible() ? <SID>press_enter() : "\<C-g>u\<CR>"
"inoremap <expr> <CR> (pumvisible() ? "\<c-y>" : "\<CR>")
" Use K for show documentation in preview window

function! s:show_documentation()
  if &filetype ==# 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

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

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Show signature help while editing
autocmd CursorHoldI * silent! call CocAction('showSignatureHelp')

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocAction('highlight')

function! s:clear_input() abort
    let s:input_word = ''
endfunction

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
    autocmd CursorMovedI * call <SID>clear_input()
augroup END

function! CocSetup(info)
  if a:info.status == 'installed' || a:info.force
    !yarn install
    call coc#util#install_extension('coc-tsserver coc-eslint coc-prettier coc-stylelint coc-css coc-tslint coc-html coc-json coc-pyls')
  elseif a:info.status == 'updated'
    !yarn install
    call coc#util#update()
  endif
endfunction
