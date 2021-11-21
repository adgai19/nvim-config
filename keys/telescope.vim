nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches(require('telescope.themes').get_dropdown({previewer=false}))<cr>
nnoremap <leader>fc <cmd>lua require('plugins.telescope').search_dotfiles()<cr>
nnoremap <leader>fx <cmd>lua require('plugins.telescope').file_browser()<cr>
nnoremap <leader>fw <cmd>lua require('plugins.telescope').find_word()<cr>
nnoremap <leader>fr <cmd>lua require('plugins.telescope').multi_rg()<cr>
nnoremap <leader>fa <cmd>Telescope frecency<cr>
nnoremap <leader>f <cmd>Telescope <cr>
nnoremap <leader>fcs <cmd>Telescope cheat fd<cr>
nnoremap <leader>fp <cmd>lua require'telescope'.extensions.project.project{}<CR>
set nocompatible hidden laststatus=2
nnoremap <leader>fk <cmd>lua require('telescope.builtin').keymaps()<cr>
