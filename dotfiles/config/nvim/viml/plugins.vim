call plug#begin(expand('<sfile>:p:h') . '/plugged')

" plugins list {{{

    " autocomplete {{{
        "自动补全
        Plug 'Shougo/deoplete.nvim'
        "不同类型文件间文本补全
        Plug 'Shougo/context_filetype.vim'
        "回显函数文档
        Plug 'Shougo/echodoc.vim'
        "viml语法
        Plug 'Shougo/neco-syntax'
        "vim补全
        Plug 'Shougo/neco-vim',     { 'for': 'vim' }
        "python补全
        Plug 'zchee/deoplete-jedi', { 'for': 'python' }
        "代码检查
        Plug 'benekastah/neomake'
    " }}} autocomplete

    " markdown {{{
        Plug 'iamcco/mathjax-support-for-mkdp'
        Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
    " }}} markdown

    " html css {{{
        Plug 'mattn/emmet-vim'            " 快速编写html
        Plug 'othree/csscomplete.vim',  { 'for': ['css', 'html', 'string', 'String', 'stylus'] }   " omni for css3
        Plug 'iamcco/csscomb.vim',      { 'for': ['css', 'stylus', 'less', 'sass'] }
        Plug 'docunext/closetag.vim',   { 'for': ['html', 'jst', 'string', 'String', 'xml', 'markdown'] }      " 自动补全html/xml标签
    " }}} html css

    " javascript {{{
        Plug 'mhartington/deoplete-typescript',     { 'for': 'typescript' }
        Plug 'carlitux/deoplete-ternjs',        { 'for': 'javascript' }
        Plug 'maksimr/vim-jsbeautify',          { 'for': ['javascript', 'html', 'css', 'json'] }       " js代码格式化
        Plug 'heavenshell/vim-jsdoc',           { 'for': 'javascript' }        " 编写注释
    " }}} javascript

    " git {{{
        Plug 'tpope/vim-fugitive'       " git插件，使用:Gstatus或:Git status
        Plug 'airblade/vim-gitgutter'   " 同git diff,实时展示文件中修改的行
        Plug 'junegunn/gv.vim'
        Plug 'cohama/agit.vim'
    " }}} git

    " cursor move and align {{{
        Plug 'bronson/vim-trailing-whitespace'  " 清除尾部空格
        Plug 'Lokaltog/vim-easymotion'          " 快速移动
        Plug 'terryma/vim-multiple-cursors'     " 多光标编辑
        Plug 'itchyny/vim-cursorword'
        Plug 'tpope/vim-surround'               " 快速环绕 ds' cs'( csw'===ysiw' ySS'
        Plug 'spf13/vim-autoclose'              " 自动关闭
        Plug 'kana/vim-textobj-user'            " 扩展文本对象
        Plug 'terryma/vim-expand-region'        " 选中区块
        Plug 'scrooloose/nerdcommenter'         " 快速注释
        Plug 'kshenoy/vim-signature'
    " }}} cursor move and align

    " Util {{{
        Plug 'ctrlpvim/ctrlp.vim'
        Plug 'dyng/ctrlsf.vim'          " 快速搜索文件
        Plug 'iamcco/dict.nvim'
        Plug 'scrooloose/nerdtree'
        Plug 'simnalamburt/vim-mundo'   " 文件历史插件
        Plug 'junegunn/vim-easy-align'  " 对齐
        "Plug 'mhinz/vim-startify'       " 开始画面：）
        Plug 'sheerun/vim-polyglot'     " 各种语言 syntax 缩进等修正增强等
        Plug 'tpope/vim-repeat'         " 重复命令 with .
        Plug 'thinca/vim-quickrun'
        Plug 'vim-ctrlspace/vim-ctrlspace'
        Plug 'junegunn/vim-peekaboo'    " 查看寄存器
        Plug 'kassio/neoterm'
        Plug 'iamcco/smartIM.nvim'
        Plug 'junegunn/goyo.vim'
        Plug 'Konfekt/FastFold'
        Plug 'metakirby5/codi.vim'
        Plug 'itchyny/calendar.vim'
        Plug 'itchyny/vim-parenmatch'   " 替换自带的 matchparent插件
        "Plug 'Shougo/denite.nvim'
        Plug 'tweekmonster/helpful.vim'
        Plug 'iamcco/go-to-file.vim'
    " }}} Util

    " UI theme font {{{
        Plug 'morhetz/gruvbox'          " 颜色主体
        Plug 'ashfinal/vim-colors-paper'
        Plug 'whatyouhide/vim-gotham'
        Plug 'vim-airline/vim-airline'        " 状态栏增强
    " }}} UI theme font

" }}} plugins list

call plug#end()

" vim:set et sw=4 ts=4 fdm=marker fdl=1:
