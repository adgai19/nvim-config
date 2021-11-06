vim.cmd([[
autocmd BufWritePost ~/.config/nvim/lua/packages.lua source <afile> | PackerSync
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END
]])
