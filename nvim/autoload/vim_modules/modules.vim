" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

" debugger functions "{{{
function! vim_modules#modules#getVariable(name) abort
    return eval(a:name)
endfunction

function! vim_modules#modules#getFunction(name) abort
    return function(a:name)
endfunction
"}}} debugger functions

" internal variable "{{{
let s:vim_modules_home = $HOME . '/.config/nvim'
let s:vim_modules_root_path = s:vim_modules_home . '/vim_modules'
let s:vim_modules_plugin_path = s:vim_modules_home . '/vim_plugins'
let s:vim_modules = []
let s:vim_plugins = []
let s:vim_plugins_after = []
let s:vim_modules_url_format = 'https://github.com/%s.git'
let s:current_path_stack = []
"}}} internal variable

" internal functions "{{{

"}}} internal functions

" export functions "{{{

function! vim_modules#modules#import_plugin(name) abort
    let l:path = s:vim_modules_plugin_path . '/' . a:name
    let l:plugin = {
                \'name': a:name,
                \'path': l:path,
                \'source': printf(s:vim_modules_url_format, a:name)
                \}
    call add(s:vim_plugins, l:plugin)
    let l:plugin_after = l:path . '/after'
    if isdirectory(l:plugin_after)
        call add(s:vim_plugins_after, l:plugin_after)
    endif
endfunction

function! vim_modules#modules#import_module(module_name) abort
    " 获取模块路径
     let l:module_path = ''
    while len(s:current_path_stack) > 0
        let l:module_path = s:current_path_stack[-1] . '/vim_modules/' . a:module_name
        if isdirectory(l:module_path)
            break
        else
            call remove(s:current_path_stack, -1)
        endif
    endwhile
    if !isdirectory(l:module_path)
        let l:module_path = s:vim_modules_root_path . '/' . a:module_name
    endif
    let l:module = {
                \'name': a:module_name,
                \'path': l:module_path,
                \'package': l:module_path . '/package.vim',
                \'init': l:module_path . '/init.vim'
                \}
    " 添加模块路径到栈里面
    call add(s:current_path_stack, l:module_path)
    " 添加模块
    call add(s:vim_modules, l:module)
    " 添加子模块
    if filereadable(l:module.package)
        execute 'source ' . l:module.package
    endif
endfunction

function! vim_modules#modules#begin(...) abort
    let s:vim_modules_home = get(a:, 1, s:vim_modules_home)
    " 添加模块路径到栈里面
    call add(s:current_path_stack, s:vim_modules_home)
    let s:vim_modules_root_path = s:vim_modules_home . '/vim_modules'
    let s:vim_modules_plugin_path = s:vim_modules_home . '/vim_plugins'
    " 保存当前的 vim_modules 路径
    if !isdirectory(s:vim_modules_plugin_path)
        call mkdir(s:vim_modules_plugin_path, 'p', '0700')
    endif
    call plug#begin(s:vim_modules_plugin_path)
endfunction

function! vim_modules#modules#end() abort
    call plug#end()
    "let l:pre = join(map(copy(s:vim_plugins), 'v:val.path'), ',')
    "execute 'set rtp^=' . fnameescape(l:pre)
    "execute 'set rtp+=' . fnameescape(join(s:vim_plugins_after, ','))
    for l:module in s:vim_modules
        if filereadable(l:module.init)
            execute 'source ' . l:module.init
        endif
    endfor
endfunction

"}}} export functions

" vim:set et sw=4 ts=4 fdm=marker fdl=1:
