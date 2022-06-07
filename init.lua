require("impatient")
require("general")
require("impatient").enable_profile()
require("autocmds")
require("keymaps")
require("packages")
require("adgai")
vim.cmd([[
source $HOME/.config/nvim/general/augrups.vim
]])
-- vim.lsp.set_log_level(vim.log.levels.DEBUG)
