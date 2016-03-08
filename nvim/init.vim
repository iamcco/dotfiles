let g:python_host_skip_check = 1
let g:python3_host_skip_check = 1

" vim-plug {
    call plug#begin('~/dotfiles/nvim/plugged')

    " deoplete and sources about {
        Plug 'Shougo/deoplete.nvim'
        Plug 'Shougo/echodoc.vim',  { 'for': 'python' }
        Plug 'Shougo/neco-syntax'
        Plug 'Shougo/neco-vim',     { 'for': 'vim' }
        Plug 'zchee/deoplete-jedi', { 'for': 'python' }

        Plug 'benekastah/neomake'
    " }

    " markdown {
        Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
    " }

    " html css {
        Plug 'mattn/emmet-vim'            " 快速编写html
        Plug 'othree/csscomplete.vim',  { 'for': ['css', 'html', 'string', 'String'] }   " omni for css3
        Plug 'docunext/closetag.vim',   { 'for': ['html', 'string', 'String', 'xml', 'markdown'] }      " 自动补全html/xml标签
        Plug 'hail2u/vim-css3-syntax',  { 'for': 'css' }
        Plug 'digitaltoad/vim-jade',    { 'for': 'jade' }
    " }

    " javascript {
        Plug 'marijnh/tern_for_vim',            { 'for': 'javascript', 'do': './npm install'}
        Plug 'jelera/vim-javascript-syntax',    { 'for': 'javascript' } " javascript增强高亮显示, 放vim-javascript上面
        Plug 'pangloss/vim-javascript',         { 'for': 'javascript' }
        Plug 'maksimr/vim-jsbeautify',          { 'for': 'javascript' }       " js代码格式化
        Plug 'heavenshell/vim-jsdoc',           { 'for': 'javascript' }        " 编写注释
        Plug 'nono/jquery.vim',                 { 'for': 'javascript' }
        Plug 'elzr/vim-json',                   { 'for': 'json' }
        Plug 'groenewege/vim-less',             { 'for': 'less' }
        Plug 'kchmck/vim-coffee-script',        { 'for': 'coffee' }
        Plug 'nikvdp/ejs-syntax'
    " }

    " python {
        Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
    " }

    " git相关插件 {
        Plug 'tpope/vim-fugitive'       " git插件，使用:Gstatus或:Git status
        Plug 'airblade/vim-gitgutter'   " 同git diff,实时展示文件中修改的行
    " }

    " 编辑，移动，对齐相关插件 {
        Plug 'bronson/vim-trailing-whitespace'  " 清除尾部空格
        Plug 'Lokaltog/vim-easymotion'          " 快速移动
        Plug 'terryma/vim-multiple-cursors'     " 多光标编辑
        Plug 'tpope/vim-surround'               " 快速环绕 ds' cs'( csw'===ysiw' ySS'
        Plug 'spf13/vim-autoclose'              " 自动关闭
        Plug 'vim-scripts/matchit.zip'          " 标签对跳转
        Plug 'kana/vim-textobj-user'
        Plug 'terryma/vim-expand-region'        " 选中区块
        Plug 'scrooloose/nerdcommenter'         " 快速注释
        Plug 'kshenoy/vim-signature'
    " }

    " Util {
        Plug 'ctrlpvim/ctrlp.vim'
        Plug 'tacahiroy/ctrlp-funky'    " ctrlp插件1 - 不用ctag进行函数快速跳转
        Plug 'dyng/ctrlsf.vim'          " 快速搜索文件
        Plug 'iamcco/dict.vim'
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        Plug 'simnalamburt/vim-mundo'   " 文件历史插件
        Plug 'junegunn/vim-easy-align'  " 对齐
        Plug 'mhinz/vim-startify'       " 开始画面：）
        Plug 'sheerun/vim-polyglot'
        Plug 'tpope/vim-repeat'         " 重复命令 with .
    " }

    " UI theme font {
        Plug 'morhetz/gruvbox'
        Plug 'Yggdroot/indentLine'    " 对齐线
        Plug 'bling/vim-airline'
        Plug 'ryanoasis/vim-devicons'
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
    set wildignore+=*.o,*~,*.pyc,*.class,*/tmp/*,*.so,*.swp,*.zip           " ignore compiled files
    set nu                                                                  " Line numbers on
    set relativenumber number
    set cursorline                                                          " Highlight current line
    set showcmd                                                             " 显示操作命令
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
        au FocusLost * :echo 'lost'
        au FocusGained * :echo 'gain'
        au InsertEnter * :setl norelativenumber number
        au InsertLeave * :setl relativenumber
        function! NumberToggle()
            if(&relativenumber == 1)
                set norelativenumber number
            else
                set relativenumber
            endif
        endfunc
        nnoremap <C-n> :call NumberToggle()<cr>
    " }

    " 设置 GitDiff mark 标记颜色
    hi! MyDiffAdd guifg=yellow
    hi! MyDiffDelete guifg=red
    hi! MyDiffChange guifg=green
    hi! MySignMarkText guifg=LightBlue
    hi! link GitGutterAdd MyDiffAdd
    hi! link GitGutterDelete MyDiffDelete
    hi! link GitGutterChange MyDiffChange
    hi! link GitGutterChangeDelete MyDiffChange
    hi! link SignatureMarkText MySignMarkText
    hi! link SignColumn   LineNr
    hi! clear DiffAdd
    hi! clear DiffDelete
    hi! clear DiffChange

" }

" 键位绑定 {

    "设置leader建为逗号
    let mapleader = ','
    let g:mapleader = ','
    let maplocalleader = '_'

    " 浏览器打开文件快捷键
    let g:browsers = {}
    let g:browsers['chrome'] = "google-chrome"
    function! ViewFile()
        exec "silent !" . g:browsers['chrome'] . " %:p"
    endfunction
    noremap <leader>go :call ViewFile()<CR>

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

    " deoplete.nvim {
        let g:deoplete#enable_at_startup = 1
        let g:deoplete#max_list = 15
        inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
        function! s:my_cr_function()
            return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
        endfunction
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " }

    " echodoc {
        let g:echodoc_enable_at_startup = 1
    "}

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

    " css complete {
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
    " }

    " vim-javascript {
        let g:html_indent_inctags = 'html,body,head,tbody'
        let g:html_indent_script1 = 'inc'
        let g:html_indent_style1 = 'inc'
        let g:jsdoc_default_mapping = '0'
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
        autocmd FileType json noremap <buffer> <leader>sf <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
        let g:vim_json_syntax_conceal = 0
    " }

    " markdown {
        autocmd BufRead,BufNewFile *.{md,mkd,markdown,mdown,mkdn,mdwn} set filetype=markdown
    " }

    " font vim-devicons {
        let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
        let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        let g:DevIconsEnableFoldersOpenClose = 1
    " }

    " markdown-preview {
        let g:mkdp_path_to_chrome = "google-chrome"
    " }

    " ctrlsf.vim {
        "依赖ag sudo apt-get install silversearcher-ag
        let g:ctrlsf_position = 'bottom'
        let g:ctrlsf_default_root = 'project'
        nmap <leader>fs <Plug>CtrlSFPrompt
        nmap <leader>fw <Plug>CtrlSFCwordPath
        nmap <Leader>fo :CtrlSFOpen<CR>
    " }

    " ctrlp.vim {
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_cmd = 'CtrlP'
        noremap <Leader>p :CtrlP ./<CR>
        noremap <Leader>b :CtrlPBuffer<CR>
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
            \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }
        let g:ctrlp_match_window_bottom=1
        let g:ctrlp_max_height=15
        let g:ctrlp_match_window_reversed=0
        let g:ctrlp_mruf_max=500
        let g:ctrlp_follow_symlinks=1
        let g:ctrlp_working_path_mode = 'ra'    " 搜索根目录使用模式
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
    " }

    " vim-gitgutter {
        let g:gitgutter_map_keys = 0
        let g:gitgutter_enabled = 1
        let g:gitgutter_highlight_lines = 1
        nnoremap <leader>gg :GitGutterToggle<CR>
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

    " vim-airline {
        let g:airline#extensions#wordcount#formatter = 'chines'
        let g:airline_powerline_fonts=1
        if !exists('g:airline_symbols')
          let g:airline_symbols = {}
        endif
    " }

    " easy-align {
        xmap ga <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)
    " }

    " NerdTree {
        map <leader>e :NERDTreeToggle<CR>
        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=2
        let NERDTreeQuitOnOpen=0
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
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

    " }

    " strify {
        let g:startify_bookmarks = [{'w': '~/workspaces/'}, {'b': '~/my/yuuko/'}, {'n': '~/my/learnNote/'}]
        let g:startify_session_dir = '~/.vimbackupfile/.vimsession'
    " }

    " mundo.vim {
        nnoremap <Leader>h :MundoToggle<CR>
    " }

" }
