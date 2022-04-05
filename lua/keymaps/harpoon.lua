local nnoremap = require("keymaps.helpers").nnoremap
vim.notify_once("loaded harpoon keymaps")

nnoremap("<leader>na", require("harpoon.mark").add_file)
nnoremap("<leader>ni", require("harpoon.ui").toggle_quick_menu)
nnoremap("<leader>np", require("harpoon.cmd-ui").toggle_quick_menu)

nnoremap("<M-t>", '<cmd>require("harpoon.ui").nav_file(1)<cr>')
nnoremap("<M-n>", '<cmd>require("harpoon.ui").nav_file(2)<cr>')
nnoremap("<M-h>", '<cmd>require("harpoon.ui").nav_file(3)<cr>')
nnoremap("<M-e>", '<cmd>require("harpoon.ui").nav_file(4)<cr>')

nnoremap(
	"<silent> <leader>ns",
	'<cmd>require("harpoon.term").sendCommand(1, 1)<CR>:lua require("harpoon.term").gotoTerminal(1)<CR>a<CR>'
)
nnoremap(
	"<silent> <leader>no",
	'<cmd>require("harpoon.term").sendCommand(2, 2)<CR>:lua require("harpoon.term").gotoTerminal(4)<CR>a<CR>'
)
nnoremap(
	"<silent> <leader>nw",
	'<cmd>require("harpoon.term").sendCommand(1, 3)<CR>:lua require("harpoon.term").gotoTerminal(4)<CR>a<CR>'
)
nnoremap(
	"<silent> <leader>nf",
	'<cmd>require("harpoon.term").sendCommand(2, 4)<CR>:lua require("harpoon.term").gotoTerminal(4)<CR>a<CR>'
)

nnoremap("<silent> <leader>nc", '<cmd>require("harpoon.term").gotoTerminal(1)<CR>a<CR>')
nnoremap("<silent> <leader>nk", '<cmd>require("harpoon.term").gotoTerminal(2)<CR>a<CR>')
