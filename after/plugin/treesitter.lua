local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

-- These two are optional and provide syntax highlighting
-- for Neorg tables and the @document.meta tag
parser_configs.norg_meta = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
		files = { "src/parser.c" },
		branch = "main",
	},
}

parser_configs.norg_table = {
	install_info = {
		url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
		files = { "src/parser.c" },
		branch = "main",
	},
}
require("nvim-treesitter.configs").setup({
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	autotag = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "g+",
			scope_incremental = "grc",
			node_decremental = "g-",
		},
	},
	context_commentstring = {
		enable = true,
	},
	indent = { enable = false },
	textobjects = {
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
	navigation = {
		enable = true,
		keymaps = {
			goto_definition = "gnd",
			list_definitions = "gnD",
			list_definitions_toc = "gO",
			goto_next_usage = "<a-*>",
			goto_previous_usage = "<a-#>",
		},
		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false, -- Whether the query persists across vim sessions
			keybindings = {
				toggle_query_editor = "o",
				toggle_hl_groups = "i",
				toggle_injected_languages = "t",
				toggle_anonymous_nodes = "a",
				toggle_language_display = "I",
				focus_language = "f",
				unfocus_language = "F",
				update = "R",
				goto_node = "<cr>",
				show_help = "?",
			},
		},
	},
	-- playground = {
	-- 	enable = true,
	-- 	disable = {},
	-- 	updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
	-- 	persist_queries = false, -- Whether the query persists across vim sessions
	-- 	keybindings = {
	-- 		toggle_query_editor = "o",
	-- 		toggle_hl_groups = "i",
	-- 		toggle_injected_languages = "t",
	-- 		toggle_anonymous_nodes = "a",
	-- 		toggle_language_display = "I",
	-- 		focus_language = "f",
	-- 		unfocus_language = "F",
	-- 		update = "R",
	-- 		goto_node = "<cr>",
	-- 		show_help = "?",
	-- 	},
	-- },
})
