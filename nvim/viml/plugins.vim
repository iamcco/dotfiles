scriptencoding utf-8
call plug#begin(expand('<sfile>:p:h') . '/plugged')

" plugins list {{{

    " autocomplete {{{
        Plug 'roxma/nvim-completion-manager'
        Plug 'roxma/ncm-github'
        Plug 'roxma/nvim-cm-tern',  { 'do': 'npm install' }
        Plug 'Shougo/neco-syntax'
        Plug 'Shougo/neco-vim',     { 'for': 'vim' }
        Plug 'w0rp/ale'
        Plug 'sgur/vim-editorconfig'
    " }}} autocomplete

    " markdown {{{
        Plug 'iamcco/mathjax-support-for-mkdp'
        Plug 'iamcco/markdown-preview.vim', { 'for': 'markdown' }
        Plug 'joker1007/vim-markdown-quote-syntax'
    " }}} markdown

    " html css {{{
        Plug 'mattn/emmet-vim'            " 快速编写html
        Plug 'docunext/closetag.vim',   { 'for': ['html', 'jst', 'string', 'String', 'xml', 'markdown'] }      " 自动补全html/xml标签
    " }}} html css

    " css {{{
        Plug 'iamcco/csscomb.vim',      { 'for': ['css', 'stylus', 'less', 'sass'] }
        Plug 'calebeby/ncm-css'
    " }}} css

    " javascript {{{
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
        Plug 'Shougo/vinarise.vim'
        Plug 'dyng/ctrlsf.vim'          " 快速搜索文件
        Plug 'iamcco/dict.vim', { 'on': 'Dict' }
        Plug 'scrooloose/nerdtree'
        Plug 'simnalamburt/vim-mundo'   " 文件历史插件
        Plug 'junegunn/vim-easy-align'  " 对齐
        Plug 'neoclide/vim-jsx-improve'
        Plug 'tpope/vim-repeat'         " 重复命令 with .
        Plug 'thinca/vim-quickrun'
        Plug 'kassio/neoterm'
        Plug 'iamcco/smartIM.nvim'
        Plug 'junegunn/goyo.vim'
        Plug 'junegunn/limelight.vim'
        Plug 'Konfekt/FastFold'
        Plug 'metakirby5/codi.vim'
        Plug 'itchyny/calendar.vim'
        Plug 'itchyny/vim-parenmatch'   " 替换自带的 matchparent插件
        Plug 'Shougo/denite.nvim'
        Plug 'chemzqm/todoapp.vim'
        Plug 'junegunn/vim-emoji'
        Plug 'pocari/vim-denite-emoji'
        Plug 'tweekmonster/helpful.vim'
        Plug 'iamcco/go-to-file.vim'
        Plug 'iamcco/go-to-rules.vim'
        Plug 'tenfyzhong/CompleteParameter.vim'
        Plug 'iamcco/react-error-codes.vim'
        Plug 'bfredl/nvim-miniyank'
        Plug 'iamcco/util.vim'
    " }}} Util

    " UI theme font {{{
        Plug 'morhetz/gruvbox'          " 颜色主体
        Plug 'icymind/NeoSolarized'
        Plug 'ashfinal/vim-colors-paper'
        Plug 'whatyouhide/vim-gotham'
        Plug 'itchyny/lightline.vim'
        Plug 'johngrib/vim-game-code-break'
    " }}} UI theme font

" }}} plugins list

call plug#end()

" vim:set et sw=4 ts=4 fdm=marker fdl=1:
