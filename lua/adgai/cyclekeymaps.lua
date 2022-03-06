local nnoremap = require("keymaps.helpers").nnoremap

local M = {}
M.mode = "normal"
M.setMode = function(mode)
	M.mode = mode
end
M.change_mode = function()
	if M.mode == "normal" then
		nnoremap("n", "<cmd>cnext<cr>")
		nnoremap("e", "<cmd>cprev<cr>")
		M.mode = "qf"

		print("current mode", M.mode)
	elseif M.mode == "qf" then
		nnoremap("n", "j")
		nnoremap("e", "k")
		M.mode = "normal"
		-- M.mode = "ll"
		--
	elseif M.mode == "ll" then
		nnoremap("n", "<cmd>nnext<cr>")
		nnoremap("e", "<cmd>nprev<cr>")
		M.mode = "normal"
	end
end

nnoremap("<C-b>", M.change_mode)
return M
