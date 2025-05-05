" if hidden not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=1
" always show signcolumns
set signcolumn=yes

if exists('+pumheight')
  " pum height
  set pumheight=30
endif

" do not show mode use statusline instead
set noshowmode

set completeopt=noinsert,menuone,noselect

if exists('&tagfunc')
  set tagfunc=CocTagFunc
endif

let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-json',
      \ 'coc-eslint',
      \ 'coc-tslint-plugin',
      \ 'coc-prettier',
      \ 'coc-stylelintplus',
      \ 'coc-vetur',
      \ 'coc-wxml',
      \ 'coc-yaml',
      \ 'coc-highlight',
      \ 'coc-vimlsp',
      \ 'coc-svg',
      \ 'coc-angular',
      \ 'coc-snippets',
      \ 'coc-yank',
      \ 'coc-git',
      \ 'coc-lists',
      \ 'coc-diagnostic',
      \ 'coc-gitignore',
      \ 'coc-project',
      \ 'coc-post',
      \ 'coc-clock',
      \ 'coc-marketplace',
      \ 'coc-jest',
      \ 'coc-flutter',
      \ 'coc-zi',
      \ 'coc-spell-checker',
      \ 'coc-cspell-dicts',
      \ 'coc-leetcode',
      \ 'coc-rainbow-fart',
      \ 'coc-utools',
      \ 'coc-sumneko-lua',
      \ 'coc-clangd',
      \ 'coc-task',
      \ 'coc-rust-analyzer',
      \ 'coc-dioxus',
      \ 'coc-ds-pinyin-lsp',
      \ 'coc-pairs',
      \]

" get pre char of cursor
function! s:get_pre_char() abort
  let l:col = col('.') - 1
  if !l:col
    return ''
  endif
  return getline('.')[l:col - 1]
endfunction

" check pre cursor if is empty
function! s:check_back_space() abort
  return s:get_pre_char() =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible()
      \? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <C-Space> to trigger snippet expand or refresh autocomplete items or
" expand pairs
" expand snippets
" expand emmet abbr
function! s:refresh_or_expand() abort
  if s:check_back_space()
    " refresh auto completion
    return coc#refresh()
  elseif coc#expandable()
    " expand snippets register for coc.nvim
    call feedkeys("\<Plug>(coc-snippets-expand)")
  elseif &filetype =~# '\v(html|typescriptreact|javascriptreact|css|scss|less|styl|markdown)'
    " expand emmet addr
    return "\<c-o>:CocCommand emmet.expand-abbreviation\<CR>"
  endif
  return ''
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> <SID>refresh_or_expand()
else
  inoremap <silent><expr> <c-@> <SID>refresh_or_expand()
endif

function s:select_expand(mode, dir) abort
  if a:dir ==# '+'
    if &filetype ==# 'html'
      execute 'CocCommand emmet.balance ' . a:mode
    else
      call expand_region#next(a:mode ==# 'n' ? 'n' : 'v', '+')
    endif
  else
    if &filetype ==# 'html'
      execute 'CocCommand emmet.balance-inward ' . a:mode
    else
      call expand_region#next(a:mode ==# 'n' ? 'n' : 'v', '-')
    endif
  endif
endfunction

xnoremap <silent> + :<c-u>call <SID>select_expand(visualmode(), '+')<CR>
nnoremap <silent> + :call <SID>select_expand('n', '+')<CR>
xnoremap <silent> - :<c-u>call <SID>select_expand(visualmode(), '-')<CR>
nnoremap <silent> - :call <SID>select_expand('n', '-')<CR>

" wrap select range to emmet
vnoremap <silent> <space>s :<c-u>execute 'CocCommand emmet.wrap-with-abbreviation ' . visualmode()<CR>

function s:comment_toggle(mode) abort
  if a:mode !=# 'n'
    normal gv
  endif
  call feedkeys("\<Plug>(vim-comment)")
endfunction
xnoremap <silent> <space>cc :<c-u>call <SID>comment_toggle(visualmode())<CR>
nnoremap <silent> <space>cc :call <SID>comment_toggle('n')<CR>

" Use K for show documentation in float window
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Remap for rename current word
nmap <space>rn <Plug>(coc-rename)

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

" Use `[e` and `]e` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]c <Plug>(coc-diagnostic-next-error)

" git hunk
nmap <silent> [g :CocCommand git.conflict.go.prev<CR>
nmap <silent> ]g :CocCommand git.conflict.go.next<CR>

" Remap keys for gotos
function! s:GoToDefinitionCb(err, ...)
  if get(a:000, 0, v:false) ==# v:false
    normal gf
  endif
endfunction
nmap <silent> gd :call CocActionAsync('jumpDefinition', function('<SID>GoToDefinitionCb'))<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references-used)
nmap <silent> <c-n> :CocCommand document.jumpToNextSymbol<CR>
nmap <silent> <c-p> :CocCommand document.jumpToPrevSymbol<CR>
" git diff
nmap <silent> <space>d <Plug>(coc-git-chunkinfo)

" Remap for format selected region
vmap <space>fm <Plug>(coc-format-selected)
nmap <space>fm <Plug>(coc-format-selected)

" Remap for do codeAction of selected region
xmap <silent> <space>a  <Plug>(coc-codeaction-selected)
nmap <silent> <space>a  <Plug>(coc-codeaction-selected)

function! s:changeCaseFromSelected(type) abort
  execute 'CocCommand utools.changeCase.toggle ' . a:type
endfunction
xmap <silent> <space>c :<C-u>execute 'CocCommand utools.changeCase.toggle ' . visualmode()<CR>
nmap <silent> <space>c :<C-u>set operatorfunc=<SID>changeCaseFromSelected<CR>g@

" ftree
nmap <silent> <space>e :CocCommand ftree.open<CR>

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <S-TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select)

" Resume latest coc list
nnoremap <silent> <space><space>  :<C-u>CocListResume<CR>
" open coc-list files
nnoremap <silent> <Space>lf :<C-u>CocList files<CR>
" Using CocList
nnoremap <silent> <Space>ll :<C-u>CocList<CR>
" Show all diagnostics
nnoremap <silent> <space>la  :<C-u>CocList --auto-preview diagnostics<cr>
" Show all buffers
nnoremap <silent> <space>lb  :<C-u>CocList buffers<cr>
" Manage extensions
nnoremap <silent> <space>le  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>lc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>lo  :<C-u>CocList --auto-preview outline<cr>
" Search workspace symbols
nnoremap <silent> <space>ls  :<C-u>CocList -I symbols<cr>
" Open yank list
nnoremap <silent> <space>ly  :<C-u>CocList -A yank<cr>
" Open translators list with the current word
nnoremap <silent> <space>lt  :<C-u>CocList --input=<C-r>=expand('<cword>')<cr> --interactive translators<cr>
" git status files
nnoremap <silent> <space>lg  :<C-u>CocList --auto-preview gstatus<CR>
" undo tree
nnoremap <silent> <space>lu  :<C-u>CocList --auto-preview undoTree<CR>
" task list
nnoremap <silent> <space>lm  :<C-u>CocList tasks<CR>
" active task list
nnoremap <silent> <space>ln  :<C-u>CocList activeTasks<CR>
" list flutter commands
nnoremap <silent> <space>cf  :<C-u>CocList --input=flutter. commands<CR>
" list git commands
nnoremap <silent> <space>cg  :<C-u>CocList --input=git. commands<CR>
" git commit/push
nnoremap <space>gc :<C-u>CocCommand utools.git.commit
nnoremap <space>gp :<C-u>CocCommand utools.git.push
nnoremap <space>gd :<C-u>DiffviewOpen <CR>

" multiple cursors
nmap <silent> <C-c> <Plug>(coc-cursors-position)
nmap <expr> <silent> <C-d> <SID>select_current_word()
xmap <silent> <C-d> <Plug>(coc-cursors-range)
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)

function! s:select_current_word()
  if !get(b:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')

" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])

" Run jest for current test
command! -nargs=0 JestCurrentTest :call CocAction('runCommand', 'jest.singleTest')

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')

function s:cursor_hight() abort
  let l:max_len = max(map(getline(1,'$'), 'len(v:val)'))
  if  line('$') > 4000 || l:max_len > 200
    return
  endif

  call CocActionAsync('highlight')
endfunction

augroup coc_au
  autocmd!

  " Or use formatexpr for range format
  autocmd FileType typescript,json,html setl formatexpr=CocAction('formatSelected')
  " Show signature help while editing
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent! call s:cursor_hight()
  " neovim >= 9 will ignore redraw send from channel
  " https://github.com/neoclide/coc.nvim/issues/2993
  autocmd User CocStatusChange redrawstatus
augroup END
