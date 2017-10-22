" plugins config {{{

" deoplete {{{
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#auto_complete_delay = 0
""let g:deoplete#max_list = 15
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" }}} deoplete

" LanguageClient-neovim"{{{
"let g:LanguageClient_serverCommands = {
        "\ 'javascript': ['tsc', '&&', ],
        "\ }
" LanguageClient-neovim"}}}

" nvim-completion-manager"{{{
let g:cm_matcher = {'module': 'cm_matchers.fuzzy_matcher', 'case': 'smartcase'}
" nvim-completion-manager"}}}

" echodoc {{{
let g:echodoc_enable_at_startup = 1
set noshowmode
" }}} echodoc

" vim-polyglot"{{{
"let g:jsx_ext_required = 1
" }}} vim-polyglot

" context_filetype {{{
if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#same_filetypes = {}
endif
let g:context_filetype#same_filetypes.javascript = 'html,string,String'
let g:context_filetype#same_filetypes.html = 'javascript,string,String'
let g:context_filetype#same_filetypes.string = 'javascript,html,String'
let g:context_filetype#same_filetypes.String = 'javascript,html,string'

" }}} context_filetype

" deoplete-ternjs {{{
set completeopt-=preview
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 1
" }}} deoplete-ternjs

" deoplete-typescript {{{
"let g:deoplete#sources#tss#javascript_support = 1
" }}} deoplete-typescript

"" neomake {{{
"let g:neomake_javascript_enabled_makers = ['eslint']
"let g:neomake_html_enabled_makers = ['tidy']
"autocmd! BufWritePost *.{js,css,html,py,vim} Neomake
"" }}} neomake

" ALE {{{
let g:ale_linters = {
            \'javascript': ['eslint'],
            \'html': ['htmlhint']
            \}
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['eslint']
"}}} ALE

" closetag {{{
let g:closetag_html_style=1     " html sytle tag matching
autocmd BufRead,BufNewFile *.{String,string} set filetype=html
" }}} closetag

" css complete {{{
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
" }}}

" vim-JsBeautify {{{
let g:html_indent_inctags = 'html,body,head,tbody'
let g:html_indent_script1 = 'inc'
let g:html_indent_style1 = 'inc'
let g:vim_json_syntax_conceal = 0
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
"nmap <silent> <C-l> ?function<cr>:noh<cr><Plug>(jsdoc)
" }}} vim-jsdoc

" coffee-script {{{
" coffee-script的缩进为2个空格
autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType coffee noremap <buffer> <leader>w :CoffeeWatch<cr>
" }}} coffee-script

" markdown {{{
autocmd BufRead,BufNewFile *.{md,mkd,markdown,mdown,mkdn,mdwn} set filetype=markdown
" }}} markdown

" font vim-devicons {{{
"let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" }}} font vim-devicons

" vim-devicons "{{{
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
"let g:WebDevIconsOS = 'Darwin'
"}}} vim-devicons

" markdown-preview {{{
if has('mac')
    let g:mkdp_path_to_chrome = "/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome"
elseif has('unix') && !has('mac')
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

" vim-trailing-whitespace {{{
map <leader><space> :FixWhitespace<cr>
" }}} vim-trailing-whitespace

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
let g:AutoClosePairs_del= "{}"
" }}} vim-autoclose

" quickrun {{{
let g:quickrun_config = {}
let g:quickrun_config.javascript = {
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

" NerdTree {{{
function! GetRootPathDirectory()
    return fnamemodify(finddir('.git', fnameescape(expand('%:p:h')) . ';'), ':h')
endfunction

function! OpenNerdTreeAtRootDirectory()
    if !g:NERDTree.IsOpen()
        exec "cd " . GetRootPathDirectory()
        NERDTreeFind "\"" . expand('%:p') . ".""
    else
        NERDTreeToggle
    endif
endfunction

map <silent> <leader>e :call OpenNerdTreeAtRootDirectory()<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

" resolve Dots after icons in NERDTree
autocmd FileType nerdtree setlocal nolist

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guifg='. a:guifg
    exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')

" }}} NerdTree

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
nnoremap <silent> ,tn :call neoterm#tnew()<CR>
" open term
nnoremap <silent> ,to :call neoterm#open()<CR>
" Toggles the last window in the current tab.
nnoremap <silent> ,tt :call neoterm#toggle()<CR>
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<CR>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<CR>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<CR>
" command
nnoremap <silent> ,tm :T
" }}} neoterm

" lightline {{{
let g:lightline = {
            \ 'colorscheme': 'solarized',
            \ 'active': {
            \   'left': [
            \             ['mode', 'paste'],
            \             ['readonly', 'filename', 'modified'],
            \             ['gitbranch', 'gitblame']
            \           ],
            \   'right': [
            \              ['linter_errors', 'linter_warnings', 'lineinfo'],
            \              ['percent'],
            \              ['filetype']
            \            ]
            \ },
            \ 'component_expand': {
            \   'gitblame': 'UserConfigGetGitBlame',
            \   'gitbranch': 'fugitive#head',
            \   'linter_warnings': 'UserConfigGetLinterWarnings',
            \   'linter_errors': 'UserConfigGetLinterErrors',
            \ },
            \ 'component_type': {
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error'
            \ },
            \ }

function! UserConfigGetLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_non_errors == 0 ? '' : printf('%d', all_non_errors)
endfunction

function! UserConfigGetLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  return l:all_errors == 0 ? '' : printf('%d', all_errors)
endfunction

autocmd User ALELint call s:UserConfigUpdateLightline()

function! s:UserConfigUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

let g:start_hold_time = localtime()
let g:start_hold_line = getcurpos()[1]
let g:start_has_show = 0
let g:user_config_blame = ''
function! UserConfigGetGitBlame() abort
    return winwidth(0) > 100 ? g:user_config_blame : ''
endfunction
function! StartHoldLine(timerId) abort
    if g:start_hold_line ==# getcurpos()[1]
        if mode() ==# 'n'
            if localtime() - g:start_hold_time >= 1
                if !g:start_has_show
                    let g:start_has_show = 1
                    let l:msg = util#git#get_current_line_blame()
                    let l:msg_format = substitute(l:msg, '\v[^(]*\(([^)]*)\).*', '\1', 'g')
                    if l:msg !=# l:msg_format
                        let l:msg_format = split(l:msg_format, ' ')
                        let g:user_config_blame = 'by ' .
                                    \ get(l:msg_format, '0', '') .
                                    \ ' at ' . get(l:msg_format, '1', '')
                        call s:UserConfigUpdateLightline()
                    endif
                endif
            endif
        endif
    else
        let g:start_hold_time = localtime()
        let g:start_has_show = 0
    endif
    let g:start_hold_line = getcurpos()[1]
    let g:start_hold_line_timer = timer_start(1000,
                \'StartHoldLine',
                \{ 'repeat': 1 })
endfunction
let g:start_hold_line_timer = timer_start(500,
            \'StartHoldLine',
            \{ 'repeat': 1 })
" }}}

" parenmatch {{{
" disable the default matchparen plugin
let g:loaded_matchparen = 1
" }}} parenmatch

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
    \ ]
let s:menus.my_commands = {
    \ 'description': 'Example commands'
    \ }
let s:menus.my_commands.command_candidates = [
    \ ['Split the window', 'vnew'],
    \ ['Open zsh menu', 'Denite menu:zsh'],
    \ ]
call denite#custom#var('menu', 'menus', s:menus)
call denite#custom#var('file_rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
"call denite#custom#source(
    "\ 'file_rec', 'matchers', ['matcher_substring'])

"}}} Denite

" miniyank {{{
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <leader>n <Plug>(miniyank-cycle)
let g:miniyank_filename = $HOME."/.miniyank.mpack"
" }}} end miniyank

" }}} plugins config

" vim:set et sw=4 ts=4 fdm=marker fdl=1:
