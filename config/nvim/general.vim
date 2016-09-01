" general config"{{{

" encoding {{{
scriptencoding utf-8
set encoding=utf-8                                                      " 设置gvim内部编码
set fileencoding=utf-8                                                  " 设置当前文件编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 " 设置支持打开的文件的编码
set fileformat=unix                                                     " 设置新文件的<EOL>格式
set fileformats=unix,dos,mac                                            " 给出文件的<EOL>格式类型
" }}} encoding

" tabs {{{
set expandtab                                                           " 设置空格代替 tab
set shiftwidth=4                                                        " 设置缩进为 4 个空格
set softtabstop=4                                                       " 设置缩进为 4 个空格
set tabstop=4                                                           " 设置缩进为 4 个空格
" }}} tabs

" wrap {{{
set nowrap                                                              " 长行不换行
" }}} wrap

" window scroll {{{
set winminheight=0                                                      " Windows can be 0 line high
set scrolljump=5                                                        " Lines to scroll when cursor leaves screen
set scrolloff=3                                                         " Minimum lines to keep above and below cursor
" }}} window scroll

" folding {{{
set foldmethod=syntax
" }}} folding

" line number {{{
set relativenumber number
au FocusLost,InsertEnter * call UseAbsNum()
au FocusGained,InsertLeave * call UseRelNum()
function! UseAbsNum()
    if !exists('#goyo')
        set norelativenumber number
    else
        set norelativenumber nonumber
    endif
endfunction
function! UseRelNum()
    if !exists('#goyo')
        set relativenumber number
    else
        set norelativenumber nonumber
    endif
endfunction
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber number
    else
        set relativenumber
    endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>
" }}} line number

" mouse {{{
set mouse+=a                                                            " 启用鼠标
set mousehide                                                           " 编辑的时候隐藏鼠标
" }}} mouse

" No annoying sound on errors and Abbrev. of messages {{{
set shortmess+=filmnrxoOtT
set noerrorbells
set novisualbell
set t_vb=
" }}} No annoying sound on errors and Abbrev. of messages

" buffer {{{
set hidden                                                              " Allow buffer switching without saving
" }}} buffer

" wildmenu {{{
set wildmenu                                                            " 增强模式中的命令行自动完成操作
set wildignore+=*.o,*~,*.pyc,*.class,*/tmp/*,*.so,*.swp,*.zip           " ignore compiled files
set completeopt=longest,menu                                            " 让vim的补全菜单行为与一般ide一致(参考vimtip1228)
" }}} wildmenu

" statusline {{{
set showcmd                                                             " 显示操作命令
set laststatus=2
"set statusline=%<%f\ " filename
"set statusline+=%w%h%m%r " option
"set statusline+=\ %{getcwd()} " current dir
"set statusline+=%=%-14.(%{&fileformat}/%{&filetype}/%{&encoding}\ %l/%L,%c%V%)\ %p%% " Right aligned file nav info
" }}} statusline

" match {{{
set showmatch                                                           " Show matching brackets/parenthesis
set smartcase                                                           " 在搜索时如果有大写字母，在大小写敏感
set ignorecase                                                          " 搜索时忽略大小写
" }}} match

" cursor {{{
set cursorline                                                          " Highlight current line
set viewoptions=folds,options,cursor,unix,slash                         " Better Unix / Windows compatibility
set virtualedit=onemore                                                 " Allow for cursor beyond last character
" }}} cursor

" spaceline {{{
set list
set listchars=tab:›\ ,trail:-,extends:#,nbsp:.                          " Highlight problematic whitespace
" }}} spaceline

" syntax {{{
"set synmaxcol=200                                                       " highlight最大的列数为200，200后的代码将没有高亮，防止处理含有特别长的行的时候，拖慢vim
" }}} syntax

" paste mode {{{
set pastetoggle=<F12>                                                   " 粘贴模式
" }}} paste mode

" autoread {{{
set autoread                                                            " 文件在外部修改自动读取
" }}} autoread

" color theme {{{
set background=dark
"let g:gruvbox_italic=1      " 启用斜体
"colorscheme gruvbox
colorscheme paper

"" 设置 GitDiff mark 标记颜色
"hi! MyDiffAdd guifg=yellow
"hi! MyDiffDelete guifg=red
"hi! MyDiffChange guifg=green
hi! MySignMarkText guifg=LightBlue
"hi! link GitGutterAdd MyDiffAdd
"hi! link GitGutterDelete MyDiffDelete
"hi! link GitGutterChange MyDiffChange
"hi! link GitGutterChangeDelete MyDiffChange
hi! link SignatureMarkText MySignMarkText
hi! link SignColumn   LineNr    " 标记一列的背景颜色
"hi! clear DiffAdd
"hi! clear DiffDelete
"hi! clear DiffChange
" }}} color theme

" change the pwd to the edit file {{{
"autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
" }}} change the pwd to the edit file

" move cursor to the first line for gitcommit {{{
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
" }}} move cursor to the first line for gitcommit

" move the cursor to right position {{{
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
"}}} move the cursor to right position

" backup {{{
set backup                  " 设置备份
if has('persistent_undo')
    set undofile                " 把undo操作保存到文件当中
endif

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
" }}} backup

" magic pattern {{{
set magic
" }}} magic pattern

" }}} general config

" vim:set et sw=4 ts=4 fdm=marker fdl=1:
