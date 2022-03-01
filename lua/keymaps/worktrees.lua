local function nnoremap(lhs, rhs)
	vim.keymap.set("n", lhs, rhs)
	-- code
end
nnoremap("<leader>gb", require("telescope").extensions.git_worktree.git_worktrees)
nnoremap("<leader>gj", require("telescope").extensions.git_worktree.create_git_worktree)
