try
  call textobj#user#plugin('tag', {
        \   'keyValA': {
        \     'pattern': '\v *(\([^()]+\)|\[[^[]]+\]|[^ ]+)\=(''[^'']*''|"[^"]*")',
        \     'select': ['ak'],
        \   },
        \   'keyValI': {
        \     'pattern': '\v(\([^()]+\)|\[[^[]]+\]|[^ ]+)\=(''[^'']*''|"[^"]*")',
        \     'select': ['ik'],
        \   },
        \ })
catch /.*/
endtry
