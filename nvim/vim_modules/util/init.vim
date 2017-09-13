" ctrlsf {{{
" ag sudo apt-get install silversearcher-ag
let g:ctrlsf_position = 'bottom'
let g:ctrlsf_default_root = 'project'
nmap <leader>fs <Plug>CtrlSFPrompt
nmap <leader>fw <Plug>CtrlSFCwordPath
nmap <Leader>fo :CtrlSFOpen<CR>
" }}} ctrlsf

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

" airline {{{
let g:airline_theme='paper'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
" }}} airline

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
call denite#custom#source(
    \ 'file_rec', 'matchers', ['matcher_substring'])

"}}} Denite
