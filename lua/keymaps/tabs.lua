local nnoremap = require("keymaps.helpers").nnoremap
local vnoremap = require("keymaps.helpers").vnoremap
local lasttab = 1
vim.api.nvim_create_autocmd("TabLeave", {
	callback = function()
		-- require("keymaps/tabs").lasttab = vim.api.nvim_tabpage_get_number(0)
		lasttab = vim.api.nvim_tabpage_get_number(0)
		print(vim.api.nvim_tabpage_get_number(0))
	end,
})

vnoremap("<m-s>", function()
	vim.api.nvim_set_current_tabpage(lasttab)
end, { silent = true })
nnoremap("<m-s>", function()
	vim.api.nvim_set_current_tabpage(lasttab)
end, { silent = true })
nnoremap("<leader>tn", ":tabnew<cr>")
