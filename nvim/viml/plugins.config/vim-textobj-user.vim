try
    call textobj#user#plugin('tag', {
                \   'keyVal': {
                \     'pattern': '\v *[^"'' ]+ *\= *(''|")[^\1]+\1',
                \     'select': ['ak', 'ik'],
                \   },
                \ })
    call textobj#user#plugin('react', {
                \   'keyVal': {
                \     'pattern': '\v *[^"'' ]+ *\= *\{\s*([^{}]*|\{[^}]*\})*\s*\}',
                \     'select': ['aK', 'iK'],
                \   },
                \ })
catch /.*/
endtry
