require('impatient')
require'general'
require'impatient'.enable_profile()
require("autocmds")
require('packages')
require('lsp')
require('plugins')
require("packer").init()
vim.cmd([[
source $HOME/.config/nvim/plug-config/telescope.vim
source $HOME/.config/nvim/keys/quikfixlist.vim
source $HOME/.config/nvim/keys/harpoon.vim
source $HOME/.config/nvim/keys/qol.vim
source $HOME/.config/nvim/keys/refactoring.vim
source $HOME/.config/nvim/general/augrups.vim
]])


vim.cmd[[
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-s> :exe "tabn ".g:lasttab<cr>
nnoremap <leader>t :tabnew<CR>

vnoremap <silent> <c-s> :exe "tabn ".g:lasttab<cr>
]]
