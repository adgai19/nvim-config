local nnoremap = require("keymaps.helpers").nnoremap
vim.notify("in cyclekeymaps")

local M = {}
M.mode = "normal"
M.change_mode = function()
	print("in change_mode")

	if M.mode == "normal" then
		print("in normal")

		nnoremap("n", "<cmd>cnext<cr>")
		nnoremap("e", "<cmd>cprev<cr>")
		print("current mode", M.mode)
		M.mode = "qf"
	elseif M.mode == "qf" then
		nnoremap("n", "j")
		--

		print("in qf")
		nnoremap("e", "k")

		print("current mode", M.mode)
		M.mode = "normal"
	end

	vim.notify("current mode", M.mode)
end

nnoremap("<C-b>", M.change_mode)
