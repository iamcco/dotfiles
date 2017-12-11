" vim:set et sw=2 ts=2 fdm=marker fdl=1:
" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

" encoding {{{
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileformat=unix
set fileformats=unix,dos,mac
" }}} encoding

" tabs {{{
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
" }}} tabs

" wrap {{{
set nowrap
" }}} wrap

" window scroll {{{
set winminheight=0
set scrolljump=5
set scrolloff=3
set splitright
" }}} window scroll

" folding {{{
"set foldmethod=syntax
" }}} folding

" line number {{{
set relativenumber number
" }}} line number

" mouse {{{
set mouse+=a
set mousehide
" }}} mouse

" No annoying sound on errors and Abbrev. of messages {{{
set shortmess+=aoOtTIc
set noerrorbells
set novisualbell
set t_vb=
" }}} No annoying sound on errors and Abbrev. of messages

" buffer {{{
set hidden
" }}} buffer

" wildmenu {{{
set wildmenu
set wildignore+=*.o,*~,*.pyc,*.class,*/tmp/*,*.so,*.swp,*.zip
set completeopt=longest,menu
" }}} wildmenu

" statusline {{{
set noshowcmd
set laststatus=2
" }}} statusline

" match {{{
set showmatch
set smartcase
set ignorecase
" }}} match

" cursor {{{
set cursorline
set colorcolumn=100
set cursorcolumn
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
" }}} cursor

" spaceline {{{
set list
set listchars=tab:›\ ,trail:-,extends:#,nbsp:.
" }}} spaceline

" syntax {{{
set synmaxcol=200
" }}} syntax

" paste mode {{{
set pastetoggle=<F12>
" }}} paste mode

" autoread {{{
set autoread
" }}} autoread

" color theme {{{
set background=dark
colorscheme NeoSolarized
" }}} color theme

" backup {{{
call UserFuncInitDir()
set backup
set undofile
" }}} backup

" updatetime {{{
set updatetime=250
" }}} updatetime

" substitution {{{
set inccommand=nosplit
" substitution }}}
