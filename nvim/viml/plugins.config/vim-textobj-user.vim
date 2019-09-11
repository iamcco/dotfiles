try
  call textobj#user#plugin('tag', {
        \   'keyVal': {
        \     'pattern': '\v *(\([^ ]+\)|\[[^ ]+\]|[a-zA-Z-_]+)\=(''[^'']*''|"[^"]*")',
        \     'select': ['ak', 'ik'],
        \   },
        \ })
catch /.*/
endtry
