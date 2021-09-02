local M = {}
-- local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

-- local telescope = require("telescope")
require("telescope").setup({
	defaults = {
		-- layout_strategy = "horizontal",
		-- p
		history = {
			path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
			limit = 100,
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		file_ignore_patterns = { "build/", "bin/" },
		prompt_prefix = ">",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		-- shorten_path = true,
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
	extensions = {
		-- bookmarks = {
		--     -- Available: 'brave', 'google_chrome', 'safari', 'firefox', 'firefox_dev'
		--     selected_browser = 'firefox',
		--
		--     -- Either provide a shell command to open the URL
		--     url_open_command = 'open',
		--
		--     -- Or provide the plugin name which is already installed
		--     -- Available: 'vim_external', 'open_browser'
		--     url_open_plugin = nil,
		--     firefox_profile_name = nil
		-- },

		fzy_native = {
			override_generic_sorter = true,
			override_file_sorter = true,
		},
		arecibo = {
			["selected_engine"] = "google",
			["url_open_command"] = "xdg-open",
			["show_http_headers"] = true,
			["show_domain_icons"] = true,
		},
		frecency = {
			show_scores = false,
			show_unindexed = true,
			ignore_patterns = { "*.git/*", "*/tmp/*" },
			workspaces = {
				["conf"] = "/home/adgai/.config",
				["project"] = "/home/adgai/projects",
			},
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})
require("telescope").load_extension("fzf")
-- require('telescope').load_extension("arecibo")
-- require('telescope').load_extension('bookmarks')
-- require('telescope').load_extension('media_files')
require("telescope").load_extension("frecency")
-- require'telescope'.load_extension("cheat")
require("telescope").load_extension("project")
-- require'telescope'.load_extension('zoxide')
-- require('telescope').load_extension('dap')
-- require('telescope').load_extension('tmux')
-- require('dap-python').setup('~/anaconda3/bin/python')
-- require('telescope').load_extension('smart_history')
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
