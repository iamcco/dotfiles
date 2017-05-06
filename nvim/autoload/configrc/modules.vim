" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

" debugger functions "{{{
function! configrc#modules#getVariable(name) abort
    return eval(a:name)
endfunction

function! configrc#modules#getFunction(name) abort
    return function(a:name)
endfunction
"}}} debugger functions

" internal variable "{{{
let s:vim_modules_home = $HOME . '/.configrc/nvim'
let s:vim_modules_root_path = s:vim_modules_home . '/vim_modules'
let s:vim_modules_repo_path = s:vim_modules_home . '/plugins'
let s:vim_modules = []
let s:vim_modules_ignore = []
let s:vim_plugins = []
let s:vim_modules_url_format = 'https://github.com/%s.git'
"}}} internal variable

" internal functions "{{{

"}}} internal functions

" export functions "{{{

function! configrc#modules#plugin_add(name) abort
    let l:path = s:vim_modules_repo_path . '/' . a:name
    let l:plugin = {
                \'name': a:name,
                \'path': l:path,
                \'source': printf(s:vim_modules_url_format, a:name)
                \}
    call add(s:vim_plugins, l:plugin)
endfunction

function! configrc#modules#add(name) abort
    let l:path = s:vim_modules_root_path . '/' . a:name
    let l:module = {
                \'name': a:name,
                \'path': l:path,
                \'package': l:path . '/package.vim',
                \'init': l:path . '/init.vim'
                \}
    " add submodules
    if filereadable(l:module.package)
        execute 'source ' . l:module.package
    endif
    " add module
    call add(s:vim_modules, l:module)
endfunction

function! configrc#modules#ignore(name) abort
    call add(s:vim_modules_ignore, a:name)
endfunction

function! configrc#modules#load() abort
    " get global vim modules list from vim modules home
    let l:vim_modules_list = glob(s:vim_modules_root_path . '/*', 0, 1)
    for l:m in l:vim_modules_list
        echo l:m
    endfor
    let l:pre = join(map(copy(s:vim_plugins), 'v:val.path'), ',')
    execute 'set rtp^=' . fnameescape(l:pre)
endfunction

function! configrc#modules#load_config() abort
    for l:module in s:vim_modules
        if filereadable(l:module.init)
            execute 'source ' . l:module.init
        endif
    endfor
endfunction

function! configrc#modules#begin(...) abort
    let s:vim_modules_home = get(a:, 1, s:vim_modules_home)
    let s:vim_modules_root_path = s:vim_modules_home . '/vim_modules'
    let s:vim_modules_repo_path = s:vim_modules_home . '/repo'
    if !isdirectory(s:vim_modules_repo_path)
        call mkdir(s:vim_modules_repo_path, 'p', '0700')
    endif
endfunction

function! configrc#modules#end() abort
    " load modules
    call configrc#modules#load()
    " load modules config
    call configrc#modules#load_config()
endfunction

"}}} export functions

" vim:set et sw=4 ts=4 fdm=marker fdl=1:
