local M = {}

M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = "~/.config/nvim/",
		file_ignore_patterns = { "autoload/" },
	})
end

M.find_word = function()
	local word = vim.fn.input("enter word to search > ")
	require("telescope.builtin").grep_string(require("telescope.themes").get_ivy({ search = word }))
end
M.file_browser = function()
	require("telescope.builtin").file_browser(require("telescope.themes").get_dropdown({ previewer = false }))
end

return M
