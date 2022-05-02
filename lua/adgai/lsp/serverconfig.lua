local lspconfig = require("lspconfig")
local on_attach = require("adgai.lsp.on_attach").on_attach

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}

local serverSetup = function(server)
	lspconfig[server].setup({ on_attach = on_attach, capabilities = capabilities })
end

local serverlist = {
	"ansiblels",
	"vimls",
	"ccls",
	"clangd",
	"cssls",
	"html",
	"emmet_ls",
	"jedi_language_server",
	"dockerls",
	"ansiblels",
	"vuels",
	"terraform_lsp",
	"eslint",
	"gopls",
}
for _, server in ipairs(serverlist) do
	serverSetup(server)
end

local configs = require("lspconfig/configs")

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

local eslint = {
	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = { "%f:%l:%c: %m" },
	lintIgnoreExitCode = true,
	formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
	formatStdin = true,
}
local util = lspconfig.util

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

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local library = vim.api.nvim_get_runtime_file("", true)
table.insert(library, "/usr/share/awesome/lib")
local opts = {
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	cmd = require("lspcontainers").command("sumneko_lua"),
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
-- lspconfig["sumneko_lua"].setup(opts)
require("lspconfig").terraform_lsp.setup({ capabilities = capabilities, on_attach = on_attach })

lspconfig.jsonls.setup({
	before_init = function(params)
		params.processId = vim.NIL
	end,
	cmd = require("lspcontainers").command("jsonls"),
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

lspconfig.texlab.setup({
	cmd = { "texlab" },
	filetypes = { "tex", "bib" },

	on_attach = on_attach,
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
lspconfig.yamlls.setup({
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
