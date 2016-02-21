" vim-plug {
    call plug#begin('~/dotfiles/nvim/plugged')

    " color theme {
        Plug 'morhetz/gruvbox'
    " }

    " General {
        Plug 'godlygeek/tabular'      " 对齐插件
        Plug 'Yggdroot/indentLine'    " 对齐线
        Plug 'majutsushi/tagbar'
    " }

    " note {
        Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
    " }

    " 语言相关，字典、自动补全 {
        Plug 'iamcco/vimcdoc'         " vim中文帮助文档
        Plug 'iamcco/vim-dict'        " 各种字典
        Plug 'iamcco/dict.vim'
    " }

    " html css {
        Plug 'mattn/emmet-vim'            " 快速编写html
        Plug 'docunext/closetag.vim', { 'for': ['html', 'string', 'xml', 'markdown']}      " 自动补全html/xml标签
        Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
        Plug 'gorodinskiy/vim-coloresque' " CSS颜色插件
        Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
    " }

    " javascript {
        Plug 'Shougo/deoplete.nvim'
        Plug 'marijnh/tern_for_vim', { 'for': 'javascript' , 'do': './npm install'}
        Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' } " javascript增强高亮显示, 放vim-javascript上面
        Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
        Plug 'maksimr/vim-jsbeautify', { 'for': 'javascript' }       " js代码格式化
        Plug 'heavenshell/vim-jsdoc', { 'for': 'javascript' }        " 编写注释
        Plug 'nono/jquery.vim', { 'for': 'javascript' }

        Plug 'elzr/vim-json', { 'for': 'json' }
        Plug 'groenewege/vim-less', { 'for': 'less' }
        Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
    " }

    " python {
        Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
        Plug 'davidhalter/jedi-vim', { 'for': 'python' }
    " }

    "文件搜索，编辑相关插件 {
        Plug 'ctrlpvim/ctrlp.vim'
        Plug 'tacahiroy/ctrlp-funky' " ctrlp插件1 - 不用ctag进行函数快速跳转
        Plug 'dyng/ctrlsf.vim'    "快速搜索文件
    " }

    " git相关插件 {
        Plug 'tpope/vim-fugitive' " git插件，使用:Gstatus或:Git status
        " 同git diff,实时展示文件中修改的行
        " 只是不喜欢除了行号多一列, 默认关闭,gs时打开
        Plug 'airblade/vim-gitgutter'
    " }

    " 编辑，移动，对齐相关插件 {
        Plug 'bronson/vim-trailing-whitespace' " 清除尾部空格
        Plug 'Lokaltog/vim-easymotion'         " 快速移动
        Plug 'terryma/vim-multiple-cursors'    " 多光标编辑
        Plug 'tpope/vim-surround'              " 快速环绕
        "ds" cs"( csw"===ysiw" ySS"
        Plug 'tpope/vim-repeat'
        Plug 'terryma/vim-expand-region'    " 选中区块
        Plug 'spf13/vim-autoclose'          " 自动关闭
        Plug 'vim-scripts/matchit.zip'      " 标签对跳转
        Plug 'kana/vim-textobj-user'
        " 显示marks - 方便自己进行标记和跳转
        " m[a-zA-Z] add mark
        " '[a-zA-Z] go to mark
        " m<Space>  del all marks
        Plug 'kshenoy/vim-signature'
        Plug 'scrooloose/nerdcommenter'   "快速注释
        "注释<leader>cc
        "取消注释<leader>cu
    " }

    " vim显示相关插件 {
        Plug 'bling/vim-airline'
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        Plug 'sjl/gundo.vim'  "文件历史插件
    " }

    call plug#end()

" }

" 常用配置 {
    " 注：使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错
    scriptencoding utf-8
    set encoding=utf-8                                                      " 设置gvim内部编码
    set fileencoding=utf-8                                                  " 设置当前文件编码
    set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 " 设置支持打开的文件的编码
    set fileformat=unix                                                     " 设置新文件的<EOL>格式
    set fileformats=unix,dos,mac                                            " 给出文件的<EOL>格式类型
    set nowrap                                                              " Do not wrap long lines
    set synmaxcol=200                                                       " highlight最大的列数为200，200后的代码将没有高亮，防止处理含有特别长的行的时候，拖慢vim
    set expandtab                                                           " 设置空格代替 tab
    set tabstop=4                                                           " 设置缩进为 4 个空格
    set shiftwidth=4                                                        " 设置缩进为 4 个空格
    set softtabstop=4                                                       " 设置缩进为 4 个空格
    set pastetoggle=<F12>                                                   " pastetoggle (sane indentation on pastes)
    set mouse+=a                                                            " Automatically enable mouse usage
    set mousehide                                                           " 编辑的时候隐藏鼠标
    set autoread                                                            " 文件在外部修改自动读取
    set shortmess+=filmnrxoOtT                                              " 使用消息简写形式，比如 readonly --> RO
    set viewoptions=folds,options,cursor,unix,slash                         " Better Unix / Windows compatibility
    set virtualedit=onemore                                                 " Allow for cursor beyond last character
    set hidden                                                              " Allow buffer switching without saving
    set completeopt=longest,menu                                            " 让vim的补全菜单行为与一般ide一致(参考vimtip1228)
    set wildmenu                                                            " 增强模式中的命令行自动完成操作
    set wildmode=list:longest,full                                          " Command <Tab> completion, list matches, then longest common part, then all.
    set wildignore=*.o,*~,*.pyc,*.class                                     " ignore compiled files
    set nu                                                                  " Line numbers on
    set relativenumber number                                               " 相对行号，行号变成相对，可以用 nj，nk，进行跳转 5j，5k，上下跳5行
    set cursorline                                                          " Highlight current line
    set linespace=0                                                         " No extra spaces between rows
    set showmatch                                                           " Show matching brackets/parenthesis
    set winminheight=0                                                      " Windows can be 0 line high
    set ignorecase                                                          " 搜索时忽略大小写
    set smartcase                                                           " 在搜索时如果有大写字母，在大小写敏感
    set scrolljump=5                                                        " Lines to scroll when cursor leaves screen
    set scrolloff=3                                                         " Minimum lines to keep above and below cursor
    set list
    set listchars=tab:›\ ,trail:-,extends:#,nbsp:.                          " Highlight problematic whitespace

    "切换到编辑文档所在目录
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    "在编辑git提交文档的时候光标移到第一行
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    "保存光标位置在前一个session中
    function! ResCur()
        if line("'\"") <= line("$")
            normal! g`"
            return 1
        endif
    endfunction
    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END

    " 设置备份 {
        set backup                  " 设置备份
        if has('persistent_undo')
            set undofile                " 把undo操作保存到文件当中
        endif

    " }

    " 初始化文件夹 {

        function! InitializeDirectories()
            let parent = $HOME . '/.vimbackupfile'
            let prefix = 'vim'
            let dir_list = {
                        \ 'backup': 'backupdir',
                        \ 'views': 'viewdir',
                        \ 'swap': 'directory' }

            if has('persistent_undo')
                let dir_list['undo'] = 'undodir'
            endif

            let common_dir = parent . '/.' . prefix

            for [dirname, settingname] in items(dir_list)
                let directory = common_dir . dirname . '/'
                if exists("*mkdir")
                    if !isdirectory(directory)
                        call mkdir(directory, 'p', 0755)
                    endif
                endif
                if !isdirectory(directory)
                    echo "Warning: Unable to create backup directory: " . directory
                    echo "Try: mkdir -p " . directory
                else
                    let directory = substitute(directory, " ", "\\\\ ", "g")
                    exec "set " . settingname . "=" . directory
                endif
            endfor
        endfunction
        call InitializeDirectories()

    " }

" }

" UI {

    " color theme {
        set background=dark
        let g:gruvbox_italic=1
        colorscheme gruvbox
    " }

    " 插入模式下用绝对行号, 普通模式下用相对 {
        au FocusLost * :set norelativenumber number
        au FocusGained * :set relativenumber
        autocmd InsertEnter * :set norelativenumber number
        autocmd InsertLeave * :set relativenumber
        function! NumberToggle()
            if(&relativenumber == 1)
                set norelativenumber number
            else
                set relativenumber
            endif
        endfunc
        nnoremap <C-n> :call NumberToggle()<cr>
    " }

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    "设置标记一列的背景颜色和数字一行颜色一致
    hi! link SignColumn   LineNr
    hi! link ShowMarksHLl DiffAdd
    hi! link ShowMarksHLu DiffChange

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2
        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        if exists('fugittive#statusline')
            set statusline+=%{fugitive#statusline()} " Git Hotness
        endif
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif

" }

" 键位绑定 {

    "设置leader建为逗号
    let mapleader = ','
    let g:mapleader = ','
    let maplocalleader = '_'

    " 浏览器打开文件快捷键
    let g:browsers = {}
    let g:browsers['chrome'] = "firefox"
    function! ViewFile()
        exec "silent !start " . g:browsers['chrome'] . " %:p"
    endfunction
    noremap <leader>go :call ViewFile()<CR>

    "容易按错的键位修正
    if has("user_commands")
        command! -bang -nargs=* -complete=file E e<bang> <args>
        command! -bang -nargs=* -complete=file W w<bang> <args>
        command! -bang -nargs=* -complete=file Wq wq<bang> <args>
        command! -bang -nargs=* -complete=file WQ wq<bang> <args>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Q q<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>
    endif
    cmap Tabe tabe

    "复制到行尾，行为向C和D
    nnoremap Y y$

    "代码折叠配置
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    "取消高亮
    nmap <silent> <leader>/ :nohlsearch<CR>

    "找到git合并中冲突的地方
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

    "进入文件的当前工作文件夹
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    "移动完自后在此选择移动块
    vnoremap < <gv
    vnoremap > >gv

    "选中状态能使用重复操作
    vnoremap . :normal .<CR>

    "在需要sudo权限的代码时候使用
    cmap w!! w !sudo tee % >/dev/null

    cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    "列出所有光标所在单词的行，并可以选择相应数字跳到该行
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    "一行中水平移动，用在很长的行中
    map zl zL
    map zh zH

    "分屏窗口移动
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

    " buffer键快速移动
    nnoremap <C-S-tab> :bp<CR>
    nnoremap <C-tab>   :bn<CR>

    " normal模式下切换到确切的tab
    noremap <leader>1 :b1<cr>
    noremap <leader>2 :b2<cr>
    noremap <leader>3 :b3<cr>
    noremap <leader>4 :b4<cr>
    noremap <leader>5 :b5<cr>
    noremap <leader>6 :b6<cr>
    noremap <leader>7 :b7<cr>
    noremap <leader>8 :b8<cr>
    noremap <leader>9 :b9<cr>
    noremap <leader>0 :blast<cr>

    "选择全部
    map <Leader>sa ggVG

" }

" plugins {

    " OmniComplete {
        "补全菜单颜色
        "hi Pmenu  guifg=#1c1c1c guibg=#F1F1F1 ctermfg=black ctermbg=Lightgray
        "hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        "hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE
    " }

    " deoplete.nvim {
        let g:deoplete#enable_at_startup = 1
        let g:deoplete#max_list = 15
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
            return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
        endfunction
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " }

    " tern_for_vim {
        set completeopt-=preview
        let tern_show_signature_in_pum = 1    " 补全菜单显示函数参数提示
        let tern_show_argument_hints = 'on_move'    " vim 最下栏显示补全参数
        set noshowmode
    " }


    " closetag 自动补全html/xml标签 {

        let g:closetag_html_style=1
        autocmd BufRead,BufNewFile *.{String,string} set filetype=html

    " }

    " vim-javascript {

        let g:html_indent_inctags = 'html,body,head,tbody'
        let g:html_indent_script1 = 'inc'
        let g:html_indent_style1 = 'inc'
        let g:jsdoc_default_mapping = '0'
        map <leader>sf :call JsBeautify()<cr>
        autocmd FileType javascript noremap <buffer>  <leader>sf :call JsBeautify()<cr>
        autocmd FileType html noremap <buffer> <leader>sf :call HtmlBeautify()<cr>
        autocmd FileType css noremap <buffer> <leader>sf :call CSSBeautify()<cr>
        " 可视化模式
        autocmd FileType javascript vnoremap <buffer> <leader>sf :call RangeJsBeautify()<cr>
        autocmd FileType html vnoremap <buffer> <leader>sf :call RangeHtmlBeautify()<cr>
        autocmd FileType css vnoremap <buffer> <leader>sf :call RangeCSSBeautify()<cr>

    " }

    " coffee-script {
        " coffee-script的缩进为2个空格
        autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 softtabstop=2 expandtab
        autocmd FileType coffee noremap <buffer> <leader>r :CoffeeRun<cr>
        autocmd FileType coffee noremap <buffer> <leader>w :CoffeeWatch<cr>
    " }

    " JSON {

        nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
        let g:vim_json_syntax_conceal = 0

    " }

    " markdown {

        autocmd BufRead,BufNewFile *.{md,mkd,markdown,mdown,mkdn,mdwn} set filetype=markdown

    " }

    " markdown-preview {
"
        let g:mkdp_path_to_chrome = "c:/Program\ Files\ (x86)/Google/Chrome/Application/chrome.exe"

    " }

    " PyMode python-syntax {
    " }

    " ctrlsf.vim {

        "依赖ag sudo apt-get install silversearcher-ag
        let g:ctrlsf_position = 'bottom'
        nmap <leader>f <Plug>CtrlSFPrompt
        nmap <leader>fw <Plug>CtrlSFCwordPath

    " }

    " ctrlp.vim {

        let g:ctrlp_map = '<leader>p'
        let g:ctrlp_cmd = 'CtrlP'
        map <leader>b :CtrlPMRU<CR>
        set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
            \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
            \ }
        "\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
        let g:ctrlp_working_path_mode=0
        let g:ctrlp_match_window_bottom=1
        let g:ctrlp_max_height=15
        let g:ctrlp_match_window_reversed=0
        let g:ctrlp_mruf_max=500
        let g:ctrlp_follow_symlinks=1

    " }

    " ctrlp-funky {

        nnoremap <Leader>fu :CtrlPFunky<Cr>
        " narrow the list down with a word under cursor
        nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
        let g:ctrlp_funky_syntax_highlight = 1
        let g:ctrlp_extensions = ['funky']

    " }

    " vim-fugitive {

        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gr :Gread<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>
        nnoremap <silent> <leader>ge :Gedit<CR>
        " Mnemonic _i_nteractive
        nnoremap <silent> <leader>gi :Git add -p %<CR>
        nnoremap <silent> <leader>gg :SignifyToggle<CR>

    " }

    " vim-gitgutter {

        let g:gitgutter_map_keys = 0
        let g:gitgutter_enabled = 0
        let g:gitgutter_highlight_lines = 1
        nnoremap <leader>gss :GitGutterToggle<CR>

    " }

    " vim-trailing-whitespace {

        map <leader><space> :FixWhitespace<cr>

    " }

    " vim-multiple-cursors {

        let g:multi_cursor_next_key='<C-m>'
        let g:multi_cursor_prev_key='<C-p>'
        let g:multi_cursor_skip_key='<C-x>'
        let g:multi_cursor_quit_key='<Esc>'

    " }

    " textobj-user {

        call textobj#user#plugin('html', {
        \   'keyVal': {
        \     'pattern': ' *[0-9a-zA-Z_-]\+ *= *"[0-9a-zA-Z_-]\+"',
        \     'select': ['ak', 'ik'],
        \   },
        \ })

    " }

    " vim-expand-region {

        map + <Plug>(expand_region_expand)
        map _ <Plug>(expand_region_shrink)

    " }

    " vim-autoclose {

        let g:AutoClosePairs_del= "{}"

    " }

    " pyflakes-vim {

        let g:pyflakes_use_quickfix = 0

    " }

    " vim-airline {

        let g:airline_powerline_fonts=1
        if !exists('g:airline_symbols')
          let g:airline_symbols = {}
        endif

    " }

    " NerdTree {

        map <leader>e :NERDTreeToggle<CR>
        "autocmd VimEnter * NERDTree
        "wincmd w
        "autocmd VimEnter * wincmd w

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=2
        let NERDTreeQuitOnOpen=0
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

    " }

    " gundo.vim {

        nnoremap <leader>h :GundoToggle<CR>

    " }

    " Tabularize {

            nmap <Leader>a& :Tabularize /&<CR>
            vmap <Leader>a& :Tabularize /&<CR>
            nmap <Leader>a= :Tabularize /=<CR>
            vmap <Leader>a= :Tabularize /=<CR>
            nmap <Leader>a" :Tabularize /"<CR>
            vmap <Leader>a" :Tabularize /"<CR>
            nmap <Leader>a=> :Tabularize /=><CR>
            vmap <Leader>a=> :Tabularize /=><CR>
            nmap <Leader>a: :Tabularize /:<CR>
            vmap <Leader>a: :Tabularize /:<CR>
            nmap <Leader>a:: :Tabularize /:\zs<CR>
            vmap <Leader>a:: :Tabularize /:\zs<CR>
            nmap <Leader>a, :Tabularize /,<CR>
            vmap <Leader>a, :Tabularize /,<CR>
            nmap <Leader>a,, :Tabularize /,\zs<CR>
            vmap <Leader>a,, :Tabularize /,\zs<CR>
            nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
            vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

    " }

" }

