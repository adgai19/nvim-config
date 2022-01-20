local function nnoremap(lhs, rhs)
	vim.keymap.set("n", lhs, rhs)
	-- code
end
nnoremap("ff", require("telescope.builtin").find_files)
-- vim.keymaps.set("n", "ff", require("telescope").find_files)
