vim.lsp.set_log_level("info")
require'general'
vim.g['lsp_log_verbose'] = 1
-- vim.g['lsp_log_file'] = vim.api.expand('~/.config/nvim/lsp.log')
vim.g['ale_disable_lsp'] =0 
vim.cmd([[
set guifont=Fira\ Code\ Nerd\ Font:8
autocmd BufWritePost ~/.config/nvim/lua/packages.lua source <afile> | PackerSync
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END
set updatetime=2000
]])

require('plugins.telescope')
require('packages')
require('plugins.lualine')
require('plugins.treesitter')
require("plugins.startify")
require('lsp')
require('cmp-setup')
vim.cmd([[
source $HOME/.config/nvim/plug-config/telescope.vim
source $HOME/.config/nvim/keys/quikfixlist.vim
source $HOME/.config/nvim/keys/harpoon.vim
source $HOME/.config/nvim/keys/qol.vim
]])
