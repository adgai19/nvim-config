require("impatient")
require("general")
require("impatient").enable_profile()
require("autocmds")
require("packages")
require("adgai.lsp")
require("plugins")
require("packer").init()
vim.cmd([[
source $HOME/.config/nvim/general/augrups.vim
source $HOME/.config/nvim/keys/init.vim
]])
