local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.norg = {
	install_info = {
		url = "https://github.com/vhyrro/tree-sitter-norg",
		files = { "src/parser.c" },
		branch = "main",
	},
}
require("nvim-treesitter.configs").setup({
	-- ensure_installed = {"lua", "cpp", "python", "c", "norg", "latex"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = {
		enable = true, -- false will disable the whole extension
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	context_commentstring = {
		enable = true,
	},
	-- indent = {enable = true},
	refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = true },
		smart_rename = { enable = true, keymaps = { smart_rename = "grr" } },
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
})
