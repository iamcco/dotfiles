scriptencoding utf-8
try
    call denite#custom#map(
                \ 'insert',
                \ '<C-j>',
                \ '<denite:move_to_next_line>',
                \ 'noremap'
                \)
    call denite#custom#map(
                \ 'insert',
                \ '<C-k>',
                \ '<denite:move_to_previous_line>',
                \ 'noremap'
                \)
    " noremap <silent> <Space> :Denite source<CR>
    noremap <silent> <c-Space> :Denite menu<CR>
    " noremap <silent> <c-p> :Denite file_rec<CR>
    " noremap <silent> <Leader>b :Denite buffer<CR>
    " Add custom menus
    let s:menus = {}
    let s:menus.neovim = {
                \ 'description': "neovim's init.vim"
                \ }
    let s:menus.neovim.file_candidates = [
                \ ['init.vim', '~/.configrc/nvim/init.vim'],
                \ ['neovim.vim', '~/.configrc/nvim/viml/neovim.vim'],
                \ ['general.vim', '~/.configrc/nvim/viml/general.vim'],
                \ ['mapping.vim', '~/.configrc/nvim/viml/mapping.vim'],
                \ ['commands.vim', '~/.configrc/nvim/viml/commands.vim'],
                \ ['plugins.vim', '~/.configrc/nvim/viml/plugins.vim'],
                \ ['plugins.config.vim', '~/.configrc/nvim/viml/plugins.config.vim'],
                \]
    let s:menus.commands = {
          \ 'description': 'commands for daily use',
          \}
    let s:menus.commands.command_candidates = [
          \ ['sync syntax from start', 'syntax sync fromstart'],
          \]
    call denite#custom#var('menu', 'menus', s:menus)
    call denite#custom#var('file_rec', 'command',
                \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
    call denite#custom#option(
                \ '_', {
                \   'highlight_matched_char': 'Type',
                \   'vertical_preview': 1,
                \  }
                \)
    call denite#custom#source(
                \ '_', 'matchers', ['matcher_fuzzy'])
    call denite#custom#source(
                \ '_', 'sorters', ['sorter_sublime'])
catch /.*/
    echoerr '[denite.nvim] plugin not installed'
endtry
