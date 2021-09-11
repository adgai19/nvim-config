let $NVIM_COC_LOG_LEVEL = 'debug'
lua vim.lsp.set_log_level("debug")
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/.config/nvim/lsp.log')
let g:ale_disable_lsp = 1
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/augrups.vim
source $HOME/.config/nvim/plug-config/nerdcommentor.vim
source $HOME/.config/nvim/plug-config/vim-lua-formatter.vim
source $HOME/.config/nvim/plug-config/vimux.vim
source $HOME/.config/nvim/keys/vim-fugutive.vim
source $HOME/.config/nvim/keys/common.vim
source $HOME/.config/nvim/plug-config/lspsaga.vim
source $HOME/.config/nvim/plug-config/vim-closetag.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/vim-devicons.vim
" source $HOME/.config/nvim/plug-config/ale.vim
source $HOME/.config/nvim/plug-config/telescope.vim
source $HOME/.config/nvim/plug-config/floterm.vim
source $HOME/.config/nvim/plug-config/wilder.vim
source $HOME/.config/nvim/plug-config/vim-go.vim
source $HOME/.config/nvim/general/lua_format.vim
source $HOME/.config/nvim/keys/quikfixlist.vim
lua require('plugins.telescope')
lua require('packages')
lua require('plugins.lualine')
lua require('plugins.treesitter')
lua require('lsp')
lua require('plugins.neorg')
" lua require('keys')
" lua require('dapsetup')
lua require('numb').setup()
" lua require('openSites')
" lua require('rustTools')
" lua require('debugger')
set guifont=Fira\ Code\ Nerd\ Font:8
autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *
\ lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }
autocmd BufWritePost ~/.config/nvim/lua/packerconfig.lua source <afile> | PackerSync
lua require('tempkeys')
lua require('plugins.refactoring')
lua require('plugins.llr')

nnoremap ; :
nnoremap : ;
source $HOME/.config/nvim/keys/harpoon.vim
