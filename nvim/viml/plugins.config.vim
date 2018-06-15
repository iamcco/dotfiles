" vim:set et sw=2 ts=2 fdm=marker fdl=1:
" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

scriptencoding utf-8

" plugins config {{{

" nvim-completion-manager {{{
let g:cm_matcher = {'module': 'cm_matchers.fuzzy_matcher', 'case': 'smartcase'}
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"let $NVIM_PYTHON_LOG_FILE="/Users/aioiyuuko/nvim_log"
"let $NVIM_NCM_LOG_LEVEL="DEBUG"
"let $NVIM_NCM_MULTI_THREAD=0
" }}} nvim-completion-manager

" ALE {{{
let g:ale_linters = {
            \ 'javascript': ['eslint'],
            \ 'html': ['htmlhint'],
            \ 'markdown': ['markdownlint']
            \ }
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'
let g:ale_fixers = {
      \ 'javascript': ['eslint']
      \ }
let g:ale_fix_on_save = 1
"}}} ALE

" closetag {{{
let g:closetag_html_style=1     " html sytle tag matching
autocmd BufRead,BufNewFile *.{String,string} set filetype=html
" }}} closetag

" vim-JsBeautify {{{
let g:html_indent_inctags = 'html,body,head,tbody'
let g:html_indent_script1 = 'inc'
let g:html_indent_style1 = 'inc'
let g:vim_json_syntax_conceal = 0
" TODO
autocmd FileType javascript noremap <buffer>  <leader>sf :call JsBeautify()<cr>
autocmd FileType javascript vnoremap <buffer> <leader>sf :call RangeJsBeautify()<cr>
autocmd FileType html noremap <buffer> <leader>sf :call HtmlBeautify()<cr>
autocmd FileType html vnoremap <buffer> <leader>sf :call RangeHtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <leader>sf :call CSSBeautify()<cr>
autocmd FileType css vnoremap <buffer> <leader>sf :call RangeCSSBeautify()<cr>
autocmd FileType json noremap <buffer> <leader>sf :call JsonBeautify()<cr>
autocmd FileType json vnoremap <buffer> <leader>sf :call RangeJsonBeautify()<cr>
" }}} vim-JsBeautify

" vim-jsdoc {{{
let g:jsdoc_input_description = 1
let g:jsdoc_enable_es6 = 1
let g:jsdoc_underscore_private = 1
" }}} vim-jsdoc

" markdown-preview {{{
if has('mac')
    let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
elseif has('unix')
    let g:mkdp_path_to_chrome = "google-chrome"
endif
" }}} markdown-preview

" ctrlsf {{{
" ag sudo apt-get install silversearcher-ag
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_default_root = 'project'
nmap <leader>fs <Plug>CtrlSFPrompt
nmap <leader>fw <Plug>CtrlSFCwordPath
nmap <Leader>fo :CtrlSFOpen<CR>
" }}} ctrlsf

" vim-fugitive {{{
" TODO: config
" }}} vim-fugitive

" vim-gitgutter {{{
" TODO: config
" }}} vim-gitgutter

" vim-multiple-cursors {{{
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
function Multiple_cursors_before()
    let g:deoplete#disable_auto_complete = 1
    call cm#disable_for_buffer()
endfunction
function Multiple_cursors_after()
    let g:deoplete#disable_auto_complete = 0
    call cm#enable_for_buffer()
endfunction
" }}} vim-multiple-cursors

" textobj-user {{{
" TODO
try
    call textobj#user#plugin('html', {
                \   'keyVal': {
                \     'pattern': ' *[^" ]\+ *= *"[^"]\+"',
                \     'select': ['ak', 'ik'],
                \   },
                \ })
catch /.*/
endtry
" }}} textobj-user

" vim-expand-region {{{
map + <Plug>(expand_region_expand)
map _ <Plug>(expand_region_shrink)
" }}} vim-expand-region

" vim-autoclose {{{
" TODO
"let g:AutoClosePairs_del= "{}"
" }}} vim-autoclose

" quickrun {{{
let g:quickrun_config = {}
let g:quickrun_config['javascript.jsx'] = {
            \'command': 'node',
            \'outputter/buffer/split': 'bo',
            \'outputter/buffer/into': 1,
            \'outputter/buffer/close_on_empty': 1
            \}
let g:quickrun_config.javascript = {
            \'command': 'node',
            \'outputter/buffer/split': 'bo',
            \'outputter/buffer/into': 1,
            \'outputter/buffer/close_on_empty': 1
            \}
let g:quickrun_config.coffee = {
            \'outputter/buffer/split': 'bo',
            \'outputter/buffer/into': 1,
            \'outputter/buffer/close_on_empty': 1
            \}
let g:quickrun_config.python = {
            \'outputter/buffer/split': 'bo',
            \'outputter/buffer/into': 1,
            \'outputter/buffer/close_on_empty': 1
            \}
let g:quickrun_config.sh = {
            \'outputter/buffer/split': 'bo',
            \'outputter/buffer/into': 1,
            \'outputter/buffer/close_on_empty': 1
            \}
" }}} quickrun

" easy-align {{{
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" }}} easy-align

" Goyo "{{{
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set nocursorcolumn
  set nocursorline
  Limelight
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=3
  set cursorcolumn
  set cursorline
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}} Goyo

" mundo {{{
nnoremap <Leader>h :MundoToggle<CR>
" }}} mundo

" neoterm {{{
let g:neoterm_size = 10
" open new term
nnoremap <silent> ,tn :Tnew<CR>
" open term
nnoremap <silent> ,to :Topen<CR>
" Toggles the last window in the current tab.
nnoremap <silent> ,tt :Ttoggle<CR>
" hide/close terminal
nnoremap <silent> ,th :Ttoggle<CR>
" clear terminal
nnoremap <silent> ,tl :Tclear<CR>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :Tkill<CR>
" command
nnoremap <silent> ,tm :T 
" }}} neoterm

" lightline {{{
let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ 'active': {
            \   'left': [
            \             ['mode', 'paste'],
            \             ['readonly', 'activeFilename', 'modified'],
            \             ['gitBranchAndBlame']
            \           ],
            \   'right': [
            \              ['linter_errors', 'linter_warnings', 'lineinfo'],
            \              ['percent'],
            \              ['filetype']
            \            ]
            \ },
            \ 'component_expand': {
            \   'activeFilename': 'UserFuncGetFileName',
            \   'gitBranchAndBlame': 'UserFuncGitBranchAndBlame',
            \   'linter_warnings': 'UserFuncGetLinterWarnings',
            \   'linter_errors': 'UserFuncGetLinterErrors',
            \ },
            \ 'component_type': {
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error'
            \ },
            \ }
call UserFuncStartLightline()
augroup UserMatchupOffscreen
  autocmd!
  autocmd User MatchupOffscreenEnter call UserFuncClearLightline()
  autocmd User MatchupOffscreenLeave call UserFuncStartLightline()
augroup END
" }}}

" matchup {{{
let g:matchup_transmute_enabled = 0
augroup matchup_matchparen_highlight
  autocmd!
  autocmd ColorScheme * hi MatchParen guibg=#075b6f guifg=None
augroup END

" }}} matchup

" Denite "{{{
call denite#custom#map(
            \ 'insert',
            \ '<C-j>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<C-k>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)
noremap <silent> <Space> :Denite source<CR>
noremap <silent> <c-p> :Denite file_rec<CR>
noremap <silent> <Leader>b :Denite buffer<CR>
" Add custom menus
let s:menus = {}
let s:menus.neovim = {
    \ 'description': 'neovim 配置文件'
    \ }
let s:menus.neovim.file_candidates = [
    \ ['init.vim', '~/.configrc/nvim/init.vim'],
    \ ['neovim.vim', '~/.configrc/nvim/viml/neovim.vim'],
    \ ['general.vim', '~/.configrc/nvim/viml/general.vim'],
    \ ['mapping.vim', '~/.configrc/nvim/viml/mapping.vim'],
    \ ['commands.vim', '~/.configrc/nvim/viml/commands.vim'],
    \ ['plugins.vim', '~/.configrc/nvim/viml/plugins.vim'],
    \ ['plugins.config.vim', '~/.configrc/nvim/viml/plugins.config.vim'],
    \]
call denite#custom#var('menu', 'menus', s:menus)
call denite#custom#var('file_rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#option(
    \ '_', {
    \   'highlight_matched_char': 'Type',
    \   'vertical_preview': 1,
    \  }
    \)
call denite#custom#source(
    \ '_', 'matchers', ['matcher_fuzzy'])
call denite#custom#source(
    \ '_', 'sorters', ['sorter_sublime'])
"}}} Denite

" vim-javascript {{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
"augroup javascript_folding
  "au!
  "au FileType javascript setlocal foldmethod=syntax
"augroup END
" }}}

" tern-javascript {{{
" map <C-]> key to jump to definition for javascript
autocmd FileType javascript noremap <buffer> <silent> <C-]> :TernDef<CR>
autocmd FileType jsx noremap <buffer> <silent> <C-]> :TernDef<CR>
autocmd FileType javascript.jsx noremap <buffer> <silent> <C-]> :TernDef<CR>
" }}}

" rainbow {{{
let g:rainbow_active = 1
" }}}

" miniyank {{{
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <leader>n <Plug>(miniyank-cycle)
let g:miniyank_filename = $HOME."/.miniyank.mpack"
" }}} end miniyank

" lightTree {{{
noremap <silent> <leader>e :LightTreeFind<CR>
" }}}

" }}} plugins config
