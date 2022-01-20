" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches(require('telescope.themes').get_dropdown({previewer=false}))<cr>
nnoremap <leader>fc <cmd>lua require('plugins.telescope').search_dotfiles()<cr>
nnoremap <leader>fx <cmd>lua require 'telescope'.extensions.file_browser.file_browser(require('telescope.themes').get_cursor({previewer=false}))<CR>
nnoremap <leader>fw <cmd>lua require('plugins.telescope').find_word()<cr>
nnoremap <leader>fww <cmd>lua require('plugins.telescope').find_word_under_cursor()<cr>
nnoremap <leader>fwb <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>fr <cmd>lua require('plugins.telescope').multi_rg()<cr>
nnoremap <leader>fa <cmd>Telescope frecency<cr>
nnoremap <leader>f <cmd>Telescope <cr>
nnoremap <leader>fcs <cmd>Telescope cheat fd<cr>
nnoremap <leader>fp <cmd>lua require'telescope'.extensions.project.project{}<CR>
set nocompatible hidden laststatus=2
nnoremap <leader>fk <cmd>lua require('telescope.builtin').keymaps()<cr>
