vim.lsp.set_log_level("debug")
require("navigator").setup({
	debug = false, -- log output
	code_action_icon = " ",
	width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
	height = 0.3, -- max list window height, 0.3 by default
	preview_height = 0.35, -- max height of preview windows
	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- border style, can be one of 'none', 'single', 'double',
	-- 'shadow', or a list of chars which defines the border
	on_attach = function(client, bufnr)
		on_attach = require("compe")
		-- your hook
		--
		-- require"lsp_signature".on_attach() -- Note: add in lsp client on-attach
		print("LSP started.")
		local opts = { noremap = true, silent = true }
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		vim.cmd([[nunmap <leader>ff]])
		buf_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
		client.resolved_capabilities.document_formatting = false
	end,
	-- put a on_attach of your own here, e.g
	-- function(client, bufnr)
	--   -- the on_attach will be called at end of navigator on_attach
	-- end,
	-- The attach code will apply to all LSP clients

	default_mapping = true, -- set to false if you will remap every key
	keymaps = {
		{ key = "gK", func = "declaration()" },
		{ key = "<leader>ff", func = "require('telescope.builtin').find_files()" },
	}, -- a list of key maps
	treesitter_analysis = true, -- treesitter variable context
	code_action_prompt = {
		enable = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	icons = {
		-- Code action
		code_action_icon = " ",
		-- Diagnostics
		diagnostic_head = "🐛",
		diagnostic_head_severity_1 = "🈲",
		-- refer to lua/navigator.lua for more icons setups
	},
	lsp = {
		format_on_save = false, -- set to false to disasble lsp code format on save (if you are using prettier/efm/formater etc)
		tsserver = {
			-- filetypes = {'typescript'} -- disable javascript etc,
			-- set to {} to disable the lspclient for all filetypes
		},
		gopls = { -- gopls setting
			on_attach = function(client, bufnr) -- on_attach for gopls
				-- your special on attach here
				-- e.g. disable gopls format because a known issue https://github.com/golang/go/issues/45732
				print("i am a hook, I will disable document format")
				client.resolved_capabilities.document_formatting = false
			end,
			settings = {
				gopls = { gofumpt = false }, -- disable gofumpt etc,
			},
		},
		-- sumneko_lua = {
		--     -- sumneko_root_path = vim.fn.expand("$HOME") ..
		--     --     "/github/lua-language-server",
		--     -- sumneko_binary = vim.fn.expand("$HOME") ..
		--     --     "/github/lua-language-server/bin/Linux/lua-language-server"
		--
		--
		-- },
		sumneko_lua = require("lua-dev").setup(),
		jdlts = {
			filetypes = {}, -- disable javascript etc,
		},
		clangd = {
			on_attach = function(client, bufnr) -- on_attach for gopls
				-- your special on attach here
				-- e.g. disable gopls format because a known issue https://github.com/golang/go/issues/45732
				print("i am a hook, I will disable document format")
				client.resolved_capabilities.document_formatting = false
			end,
		},

		ccls = {
			on_attach = function(client, bufnr) -- on_attach for gopls
				-- your special on attach here
				-- e.g. disable gopls format because a known issue https://github.com/golang/go/issues/45732
				print("i am a hook, I will disable document format")
				client.resolved_capabilities.document_formatting = false
			end,
		},
	},
})
