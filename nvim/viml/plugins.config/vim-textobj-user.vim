try
  call textobj#user#plugin('tag', {
        \   'a': {
        \     'pattern': '\v *\*?((\[[^]]*\])|(\([^)]*\))|([^ ]+))\s*\=\s*((''[^'']*'')|("[^"]*")|(\{[^}]*\}))',
        \     'select': ['ak'],
        \   },
        \   'i': {
        \     'pattern': '\v\*?((\[[^]]*\])|(\([^)]*\))|([^ ]+))\s*\=\s*((''[^'']*'')|("[^"]*")|(\{[^}]*\}))',
        \     'select': ['ik'],
        \   },
        \ })
catch /.*/
endtry
