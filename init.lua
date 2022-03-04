-- require("impatient")
require("general")
-- require("impatient").enable_profile()
require("autocmds")
require("keymaps")
require("packer").init()
require("packages")
require("adgai.lsp")
require("adgai.cyclekeymaps")
-- require("plugins")
vim.cmd([[
source $HOME/.config/nvim/general/augrups.vim
source $HOME/.config/nvim/keys/init.vim
]])
