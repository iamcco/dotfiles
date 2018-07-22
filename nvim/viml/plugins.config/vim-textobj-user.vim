try
    " pattern: ( *[^" ]+ *\= *(''|")[^\2]+\2)
    " key="value"
    "
    " pattern: ( *[^" ]+ *\= *\{(\s|\n)*\{([^{}]*|\{[^}]*\})*\}(\s|\n)*\})
    " style={{ height: 200 }}
    call textobj#user#plugin('tag', {
                \   'keyVal': {
                \     'pattern': '\v( *[^" ]+ *\= *(''|")[^\2]+\2)|( *[^" ]+ *\= *\{(\s|\n)*\{([^{}]*|\{[^}]*\})*\}(\s|\n)*\})',
                \     'select': ['ak', 'ik'],
                \   },
                \ })
catch /.*/
endtry
