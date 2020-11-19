let g:lua_tree_side = 'left' "left by default
let g:lua_tree_width = 30 "30 by default
let g:lua_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:lua_tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:lua_tree_auto_close = 0 "0 by default, closes the tree when it's the last window
let g:lua_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:lua_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:lua_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:lua_tree_hide_dotfiles = 0 "0 by default, this option hides files and folders starting with a dot `.`
let g:lua_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:lua_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:lua_tree_tab_open = 0 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:lua_tree_allow_resize = 1 "0 by default, will not resize the tree when opening a file
let g:lua_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 1,
    \ 'files': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath

" You can edit keybindings be defining this variable
" You don't have to define all keys.
" NOTE: the 'edit' key will wrap/unwrap a folder and open a file
let g:lua_tree_bindings = {
    \ 'edit':            ['<CR>', 'o'],
    \ 'edit_vsplit':     '<C-v>',
    \ 'edit_split':      '<C-x>',
    \ 'edit_tab':        '<C-t>',
    \ 'toggle_ignored':  'I',
    \ 'toggle_dotfiles': 'H',
    \ 'refresh':         'R',
    \ 'preview':         '<Tab>',
    \ 'cd':              '<C-]>',
    \ 'create':          'a',
    \ 'remove':          'd',
    \ 'rename':          'r',
    \ 'cut':             'x',
    \ 'copy':            'c',
    \ 'paste':           'p',
    \ 'prev_git_item':   '[c',
    \ 'next_git_item':   ']c',
    \ }

" Disable default mappings by plugin
" Bindings are enable by default, disabled on any non-zero value
" let lua_tree_disable_keybindings=1

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:lua_tree_icons = {
    \ 'default': ' ',
    \ 'symlink': ' ',
    \ 'git': {
    \   'unstaged': " ★",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "?"
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': ""
    \   }
    \ }

nnoremap <silent> <Space>e :LuaTreeToggle<CR>
nnoremap <silent> <Space>r :LuaTreeRefresh<CR>
nnoremap <silent> <Space>f :LuaTreeFindFile<CR>

" a list of groups can be found at `:help lua_tree_highlight`

" hide statusline for LuaTree window
let g:statusline['LuaTree'] = {
      \   'active': '%#StlNormal#',
      \   'deactive': '%#StlNormal#'
      \ }
