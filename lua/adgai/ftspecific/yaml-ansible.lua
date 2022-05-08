-- local ansible_goto_role_paths={'./roles','../_common/roles'}
vim.cmd([[set path+=roles/]])
local FindAnsibleRoleUnderCursor = function()
	local role_paths = "./roles/"
	local task_main = vim.fn.expand("<cword>") .. "/tasks/main.yml"
	local role_file = vim.fn.findfile(role_paths .. task_main)
	vim.pretty_print(role_paths .. task_main)
	vim.pretty_print(role_file)
	if role_file == "" then
		print("nothing found")
	else
		vim.cmd(":e" .. role_file)
	end
end

local nnoremap = require("keymaps.helpers").nnoremap
local augroup = vim.api.nvim_create_augroup("ansible", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	pattern = "yaml.ansible",
	callback = function()
		nnoremap("<leader>gf", FindAnsibleRoleUnderCursor)
	end,
	group = augroup,
})
