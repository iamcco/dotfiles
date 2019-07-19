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
      \ 'coc-word',
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
      \ 'coc-translator',
      \ 'coc-marketplace',
      \ 'coc-smartf',
      \ 'coc-tabnine',
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
nnoremap <silent> K :call CocAction('doHover')<CR>

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

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" float window scroll
nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"

" Using CocList
nnoremap <silent> <Space><Space> :CocList<CR>
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" git status
nnoremap <silent> <space>g  :<C-u>CocList --normal --auto-preview gstatus<CR>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Open yank list
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" press <esc> to cancel.
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

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
  autocmd ColorScheme * highlight! CocHighlightText  guibg=#054c20 ctermbg=023
  " do not underline error/info/hit lines
  autocmd ColorScheme * highlight! CocErrorHighlight cterm=None gui=None
  autocmd ColorScheme * highlight! CocWarningHighlight cterm=None gui=None
  autocmd ColorScheme * highlight! CocInfoHighlight cterm=None gui=None
  autocmd ColorScheme * highlight! CocHintHighlight cterm=None gui=None
  " virtual text highlight
  autocmd ColorScheme * highlight! CocCodeLens guifg=#606060 ctermfg=60
  " smartf
  autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#ffbf67
  autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup END
