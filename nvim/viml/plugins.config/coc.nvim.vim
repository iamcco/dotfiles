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

" do not show mode use statuline instead
set noshowmode

set completeopt=noinsert,menuone,noselect

let g:coc_global_extensions = [
      \ 'coc-emoji',
      \ 'coc-tsserver',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-json',
      \ 'coc-eslint',
      \ 'coc-tslint-plugin',
      \ 'coc-prettier',
      \ 'coc-stylelint',
      \ 'coc-pyls',
      \ 'coc-java',
      \ 'coc-rls',
      \ 'coc-solargraph',
      \ 'coc-vetur',
      \ 'coc-wxml',
      \ 'coc-yaml',
      \ 'coc-highlight',
      \ 'coc-emmet',
      \ 'coc-vimlsp',
      \ 'coc-tailwindcss',
      \ 'coc-svg',
      \ 'coc-angular',
      \ 'coc-snippets',
      \ 'coc-imselect',
      \ 'coc-yank',
      \ 'coc-pairs',
      \ 'coc-git',
      \ 'coc-lists',
      \ 'coc-diagnostic',
      \ 'coc-gitignore',
      \ 'coc-project',
      \ 'coc-post',
      \ 'coc-clock',
      \ 'coc-marketplace',
      \ 'coc-smartf',
      \ 'coc-tabnine',
      \ 'coc-jest',
      \ 'coc-calc',
      \ 'coc-webpack',
      \ 'coc-explorer',
      \ 'coc-svelte',
      \ 'coc-flutter',
      \ 'coc-zi',
      \ 'coc-spell-checker',
      \ 'coc-cspell-dicts',
      \ 'coc-actions',
      \ 'https://github.com/xabikos/vscode-react',
      \ 'https://github.com/xabikos/vscode-javascript'
      \]

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
" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" expand snippets
" Use <C-Space> to trigger snippet expand or refresh autocomplete items
imap <silent> <expr> <C-Space> <SID>check_back_space() ? coc#refresh() : "\<Plug>(coc-snippets-expand)"

" Use K for show documentation in float window
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" git hunk
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
nmap gs <Plug>(coc-git-chunkinfo)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" git diff
nmap <silent> <leader>d <Plug>(coc-git-chunkinfo)

" Remap for format selected region
vmap <leader>fm <Plug>(coc-format-selected)
nmap <leader>fm <Plug>(coc-format-selected)

" Remap for do codeAction of selected region
vmap <silent> <space>a :<C-u>CocCommand actions.open<CR>
nmap <silent> <space>a :<C-u>CocCommand actions.open<CR>

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Using CocList
nnoremap <silent> <Space>ll :<C-u>CocList<CR>
" Show all diagnostics
nnoremap <silent> <space>la  :<C-u>CocList diagnostics<cr>
" Show all buffers
nnoremap <silent> <space>lb  :<C-u>CocList buffers<cr>
" Manage extensions
nnoremap <silent> <space>le  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>lc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>lo  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>ls  :<C-u>CocList -I symbols<cr>
" Open yank list
nnoremap <silent> <space>ly  :<C-u>CocList -A --normal yank<cr>
" Open translators list with the current word
nnoremap <silent> <space>lt  :<C-u>CocList --input=<C-r>=expand('<cword>')<cr> --interactive translators<cr>
" git status files
nnoremap <silent> <space>lg  :<C-u>CocList --normal --auto-preview gstatus<CR>
" git commands
nnoremap <silent> <space>cg  :<C-u>CocList --input=git. --normal commands<CR>
" flutter commands
nnoremap <silent> <space>cf  :<C-u>CocList --input=flutter. --normal commands<CR>
" Resume latest coc list
nnoremap <silent> <space><space>  :<C-u>CocListResume<CR>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

" press <esc> to cancel.
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)

" coc-explorer
noremap <silent> <leader>e :execute 'CocCommand explorer' .
      \ ' --toggle' .
      \ ' --sources=file+'<CR>

" multiple cursors
nmap <silent> <C-c> <Plug>(coc-cursors-position)
nmap <expr> <silent> <C-d> <SID>select_current_word()
xmap <silent> <C-d> <Plug>(coc-cursors-range)
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)

function! s:select_current_word()
  if !get(g:, 'coc_cursors_activated', 0)
    return "\<Plug>(coc-cursors-word)"
  endif
  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunc

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

" do not underline error/info/hit lines
highlight NoCocUnderline cterm=None gui=None

augroup coc_au
  autocmd!
  " Or use formatexpr for range format
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Show signature help while editing
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " Use K for show documentation in preview window
  " autocmd CursorHold * call CocActionAsync('doHover')

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " highlight text color
  autocmd ColorScheme * highlight! CocHighlightText guibg=#054c20 ctermbg=023
  " do not underline error/info/hit lines
  " autocmd ColorScheme * highlight! link CocErrorHighlight NoCocUnderline
  " autocmd ColorScheme * highlight! link CocWarningHighlight NoCocUnderline
  " autocmd ColorScheme * highlight! link CocInfoHighlight NoCocUnderline
  " autocmd ColorScheme * highlight! link CocHintHighlight NoCocUnderline
  " error/warning/info/hit sign
  autocmd ColorScheme * highlight! CocErrorSign ctermfg=Red guifg=#ea6962
  autocmd ColorScheme * highlight! CocWarningSign ctermfg=Yellow guifg=#e3a84e
  autocmd ColorScheme * highlight! CocInfoSign ctermfg=Blue guifg=#7dae9b
  autocmd ColorScheme * highlight! CocHintSign ctermfg=Blue guifg=#7dae9b
  " virtual text highlight
  autocmd ColorScheme * highlight! CocCodeLens guifg=#606060 ctermfg=60
  " smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#ffbf67
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
  " diff sign highlight groups
  autocmd ColorScheme * highlight GitAddHi    guifg=#b8bb26 ctermfg=40
  autocmd ColorScheme * highlight GitModifyHi guifg=#83a598 ctermfg=33
  autocmd ColorScheme * highlight GitDeleteHi guifg=#f3423a ctermfg=196
  autocmd ColorScheme * highlight CocCursorRange guibg=#b16286 guifg=#ebdbb2
augroup END
