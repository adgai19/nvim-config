local lspconfig = require("lspconfig")
local lspcontainers = require("lspcontainers")

local on_attach = require("adgai.lsp.on_attach").on_attach
local make_client_capabilities = require("adgai.lsp.on_attach").make_client_capabilities

-- normal lsp servers
local serverSetup = function(server)
	lspconfig[server].setup({ on_attach = on_attach, capabilities = make_client_capabilities() })
end

local serverlist = { "ansiblels", "vimls", "ccls", "cssls", "emmet_ls", "jedi_language_server", "eslint" }
for _, server in ipairs(serverlist) do
	serverSetup(server)
end

-- lspcontainer servers with no special options
local serverContainerSetup = function(server, opts)
	opts = opts or {}
	opts.on_attach = on_attach
	opts.capabilities = make_client_capabilities()
	opts.cmd = lspcontainers.command(server)
	lspconfig[server].setup(opts)
end

local normalServerContainerList = { "clangd", "gopls", "pylsp", "rust_analyzer" }
for _, server in ipairs(normalServerContainerList) do
	serverContainerSetup(server)
end

-- lspcontainer servers with beforeInit
local beforeInitServers = { "html", "yamlls", "dockerls", "vuels" }
local beforeInitOptions = {
	before_init = function(params)
		params.processId = vim.NIL
	end,
}
for _, server in ipairs(beforeInitServers) do
	serverContainerSetup(server, beforeInitOptions)
end

-- other servers
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
local library = vim.api.nvim_get_runtime_file("", true)
table.insert(library, "/usr/share/awesome/lib")
local opts = {
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
serverContainerSetup("sumneko_lua", opts)

local jsonOpts = {
	before_init = function(params)
		params.processId = vim.NIL
	end,
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
}
serverContainerSetup("jsonls", jsonOpts)
