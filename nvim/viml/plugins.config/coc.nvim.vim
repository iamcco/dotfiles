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
inoremap <silent> <C-x><C-u> <Plug>(coc-complete-custom)
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

" Show signature help while editing
autocmd CursorHoldI,CursorMovedI * silent! call CocAction('showSignatureHelp')

let s:action_types = ['jumpDefinition', 'jumpImplementation']
let s:current_action_index = 0

function! s:goto() abort
    for l:action in s:action_types
        call CocAction(l:action)
    endfor
endfunction

augroup CocActionMapping
    autocmd!
    autocmd FileType javascript noremap <buffer> <silent> <C-]> :call <SID>goto()<CR>
    autocmd FileType jsx noremap <buffer> <silent> <C-]> :call <SID>goto()<CR>
    autocmd FileType ts noremap <buffer> <silent> <C-]> :call <SID>goto()<CR>
    autocmd FileType tsx noremap <buffer> <silent> <C-]> :call <SID>goto()<CR>
    autocmd FileType javascript.jsx noremap <buffer> <silent> <C-]> :call <SID>goto()<CR>
    autocmd FileType python noremap <buffer> <silent> <C-]> :call <SID>goto()<CR>
augroup END

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
