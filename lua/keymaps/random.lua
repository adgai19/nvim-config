local nnoremap = require("keymaps.helpers").nnoremap
local vnoremap = require("keymaps.helpers").vnoremap
local inoremap = require("keymaps.helpers").inoremap
local xnoremap = require("keymaps.helpers").xnoremap
local tnoremap = require("keymaps.helpers").tnoremap

nnoremap("<leader>ps", "<cmd>PackerSync<cr>")

nnoremap(";", ":")
nnoremap(":", ";")
nnoremap("j", "e")
nnoremap("e", "j")
nnoremap("k", "n")
nnoremap("n", "k")
vnoremap("j", "e")
vnoremap("e", "j")
vnoremap("k", "n")
vnoremap("n", "k")
nnoremap("<M-q>", "<cmd>q<CR>")

inoremap(";;", "<esc>A;<CR>")

vnoremap("E", ":m '>+1<CR>gv=gv")

vnoremap("N", ":m '<-2<CR>gv=gv")
nnoremap("<Leader>=", ":vertical resize +5<CR>")
nnoremap("<Leader>-", ":vertical resize -5<CR>")

nnoremap("<Leader>h", " :split<cr>")
nnoremap("<Leader>v", " :vsplit<cr>")
nnoremap("<Leader>s", " :w<cr>:so %<cr>")

nnoremap("<space>ca", "require('code_action_menu').open_code_action_menu")
xnoremap("<leader>p", '"_dP')

nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')
nnoremap("<leader>cf", "<cmd>Explore<cr>")

nnoremap("Q", "@q")
nnoremap("J", "zJ`z")

nnoremap("<C-up>", " gt")
nnoremap("<C-down>", " gT")

vnoremap("<", " <gv")
vnoremap(">", " >gv")

tnoremap([[<Esc>]], [[<C-\><C-n>]])
nnoremap([[\]], ":Rg<space>")
