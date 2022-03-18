local lspconfig = require("lspconfig")

lspconfig.gopls.setup({})

lspconfig.texlab.setup({
	cmd = { "texlab" },
	filetypes = { "tex", "bib" },

	settings = {
		texlab = {
			auxDirectory = ".",
			bibtexFormatter = "texlab",
			build = {
				args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
				executable = "latexmk",
				forwardSearchAfter = false,
				onSave = false,
			},
			chktex = { onEdit = false, onOpenAndSave = false },
			diagnosticsDelay = 300,
			formatterLineLength = 80,
			forwardSearch = { args = {} },
			latexFormatter = "latexindent",
			latexindent = { modifyLineBreaks = false },
		},
	},
})

lspconfig.vimls.setup({})

lspconfig.ccls.setup({})

lspconfig.clangd.setup({})

local configs = require("lspconfig/configs")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not lspconfig.emmet_ls then
	configs.emmet_ls = {
		default_config = {
			cmd = { "emmet-ls", "--stdio" },
			filetypes = { "html", "css" },
			root_dir = function(fname)
				return vim.loop.cwd()
			end,
			settings = {},
		},
	}
end

lspconfig.emmet_ls.setup({ capabilities = capabilities })

lspconfig.eslint.setup({})
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

lspconfig.cssls.setup({ capabilities = capabilities })

lspconfig.jedi_language_server.setup({ capabilities = capabilities })

lspconfig.html.setup({ capabilities = capabilities })

local on_attach = require("adgai.lsp.on_attach").on_attach

lspconfig.dockerls.setup({ on_attach = on_attach })

lspconfig.ansiblels.setup({ on_attach = on_attach })
lspconfig.vuels.setup({ on_attach = on_attach, capabilities = capabilities })

lspconfig.tsserver.setup({
	-- root_dir = lspconfig.util.root_pattern("yarn.lock","package.json", "lerna.json", ".git"),
	-- settings = { documentFormatting = false },
	--
	init_options = require("nvim-lsp-ts-utils").init_options,
	on_attach = function(clients, bufnr)
		-- code
		--

		local ts_utils = require("nvim-lsp-ts-utils")

		-- defaults
		ts_utils.setup({
			debug = false,
			disable_commands = false,
			enable_import_on_completion = false,

			-- import all
			import_all_timeout = 5000, -- ms
			-- lower numbers = higher priority
			import_all_priorities = {
				same_file = 1, -- add to existing import statement
				local_files = 2, -- git files or files with relative path markers
				buffer_content = 3, -- loaded buffer content
				buffers = 4, -- loaded buffer names
			},
			import_all_scan_buffers = 100,
			import_all_select_source = false,

			-- filter diagnostics
			filter_out_diagnostics_by_severity = {},
			filter_out_diagnostics_by_code = {},

			-- inlay hints
			auto_inlay_hints = true,
			inlay_hints_highlight = "Comment",

			-- update imports on file move
			update_imports_on_move = false,
			require_confirmation_on_move = false,
			watch_dir = nil,
		})

		-- required to fix code action ranges and filter diagnostics
		-- ts_utils.setup_client(clients)

		-- no default maps, so you may want to define some here
		local opts = { silent = true }
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
		on_attach(clients, bufnr)
	end,
})

local eslint = {
	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
	lintIgnoreExitCode = true,
	formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
	formatStdin = true,
}
local util = require("lspconfig").util

lspconfig.efm.setup({
	init_options = { documentFormatting = true },
	filetypes = { "javascript", "typescript" },
	root_dir = function(fname)
		return util.root_pattern("tsconfig.json")(fname) or util.root_pattern(".eslintrc.js", ".git")(fname)
	end,
	settings = {
		rootMarkers = { ".eslintrc.js", ".git/" },
		languages = {
			javascript = { eslint },
			typescript = { eslint },
		},
	},
})

--
local sumneko_root_path = "/home/adgai/dev/lua-language-server"

local sumneko_binary = sumneko_root_path .. "/bin/" .. "/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local library = vim.api.nvim_get_runtime_file("", true)
table.insert(library, "/usr/share/awesome/lib")
local opts = {
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	on_attach = require("adgai.lsp.on_attach").on_attach,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = library,
			},
			telemetry = { enable = false },
		},
	},
}
lspconfig.sumneko_lua.setup(opts)

lspconfig.jsonls.setup({
	cmd = { "vscode-json-language-server", "--stdio" },
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			schemas = {
				{
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json",
				},
				{
					fileMatch = { "tsconfig*.json" },
					url = "https://json.schemastore.org/tsconfig.json",
				},
				{
					fileMatch = {
						".prettierrc",
						".prettierrc.json",
						"prettier.config.json",
					},
					url = "https://json.schemastore.org/prettierrc.json",
				},
				{
					fileMatch = { ".eslintrc", ".eslintrc.json" },
					url = "https://json.schemastore.org/eslintrc.json",
				},
				{
					fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
					url = "https://json.schemastore.org/babelrc.json",
				},
				{
					fileMatch = { "lerna.json" },
					url = "https://json.schemastore.org/lerna.json",
				},
				{
					fileMatch = { "now.json", "vercel.json" },
					url = "https://json.schemastore.org/now.json",
				},
				{
					fileMatch = {
						".stylelintrc",
						".stylelintrc.json",
						"stylelint.config.json",
					},
					url = "http://json.schemastore.org/stylelintrc.json",
				},
			},
		},
	},
})
require("lspconfig").yamlls.setup({
	settings = {
		yaml = {
			-- schemas = {
			-- 	-- ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
			-- 	-- ["../path/relative/to/file.yml"] = "/.github/workflows/*"
			-- 	-- ["/path/from/root/of/project"] = "/.github/workflows/*"
			-- },
		},
	},
})
