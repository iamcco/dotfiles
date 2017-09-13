" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

scriptencoding utf-8

function! FormatLog#log#echo(logList) abort
    1,$d
    for l:logItem in a:logList
        let l:line = l:logItem.str
        call append('$', l:line)
    endfor
endfunction

function! FormatLog#log#getLine() abort
    "结果数组
    let l:result = []
    "缓存数组
    let l:items = []
    "缓存符号
    let l:token = []
    "所有行
    let l:lines = getline('^', '$')
    "遍历所有行
    for l:line in l:lines
        while len(l:line) > 0
            "遇到 `[` 并且不是在 `{` 内
            if l:line[0] ==# '[' && get(l:token, 0, '') !=# '{'
                call insert(l:token , '[')
                call insert(l:items, {
                            \'str': '['
                            \})
            "遇到 `{` 并且不在 `{` 内
            elseif l:line[0] ==# '{' && get(l:token, 0, '') !=# '{'
                call insert(l:token , '{')
                if len(l:items)
                    let l:items[0].isJson = 1
                    let l:items[0].json = get(l:items[0], 'json', [])
                    call insert(l:items[0].json, '{')
                    let l:items[0].str = l:items[0].str . '{{JSON}}'
                endif
            "添加字符
            elseif len(l:items)
                "添加 json
                if get(l:token, 0, '') ==# '{'
                    if len(l:items[0].json)
                        let l:items[0].json[0] = l:items[0].json[0] . l:line[0]
                    endif
                else
                    let l:items[0].str = l:items[0].str . l:line[0]
                endif
            endif

            if l:line[0] ==# ']' && get(l:token, 0, '') ==# '['
                if len(l:token)
                    call remove(l:token, 0)
                endif
                if len(l:items)
                    let l:temp = remove(l:items, 0)
                endif
                "如果是 `[` 中的 `[`
                if (get(l:token, 0, '') ==# '[')
                    let l:items[0].str = l:items[0].str . l:temp.str
                else
                    call add(l:result, l:temp)
                endif
            elseif l:line[0] ==# '}'
                if len(l:token)
                    call remove(l:token, 0)
                endif
            endif
            let l:line = l:line[1:-1]
        endwhile
    endfor
    return l:result
endfunction

" vim:set et sw=4 ts=4 fdm=marker fdl=1:
