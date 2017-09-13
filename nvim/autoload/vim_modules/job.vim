" Author:   年糕小豆汤 <ooiss@qq.com>
" Github:   https://github.com/iamcco
" License:  MIT License

function! s:JobHandler(job_id, data, event) dict
    if a:event == 'stdout'
        let str = self.shell.' stdout: '.join(a:data)
    elseif a:event == 'stderr'
        let str = self.shell.' stderr: '.join(a:data)
    else
        let str = self.shell.' exited'
    endif

    call append(line('$'), str)
endfunction

let s:callbacks = {
            \ 'on_stdout': function('s:JobHandler'),
            \ 'on_stderr': function('s:JobHandler'),
            \ 'on_exit': function('s:JobHandler')
            \ }
let job2 = jobstart(['git', 'clone', 'https://github.com/iamcco/HomePage.git', '-v', '--progress'], extend({'shell': 'shell 2'}, s:callbacks))

" vim:set et sw=4 ts=4 fdm=marker fdl=1:
