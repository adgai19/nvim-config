local lspconfig = require("lspconfig")
--gopls setup
lspconfig.gopls.setup({})
--latex setup
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
--vim ls
lspconfig.vimls.setup({})

--c/cpp
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

lspconfig.html.setup({ capabilities = capabilities })

local on_attach = require("lsp").on_attach

-- TSServer Setup
print("tsserver")
lspconfig.tsserver.setup({
	-- root_dir = lspconfig.util.root_pattern("yarn.lock","package.json", "lerna.json", ".git"),
	-- settings = { documentFormatting = false },
	on_attach = on_attach,
})

-- efm server will take care of this later
-- local languages = {
-- 	typescript = { prettier, eslint },
-- 	javascript = { prettier, eslint },
-- 	typescriptreact = { prettier, eslint },
-- 	javascriptreact = { prettier, eslint },
-- 	yaml = { prettier },
-- 	json = { prettier },
-- 	html = { prettier },
-- 	scss = { prettier },
-- 	css = { prettier },
-- 	markdown = { prettier },
-- }

-- lspconfig.efm.setup {
--   root_dir = lspconfig.util.root_pattern("yarn.lock", "lerna.json", ".git"),
--   -- filestypes = vim.tbl_keys(languages),
--   -- init_options = { documentFormatting = true, codeAction = true },
--   -- settings = { languages = languages, log_level = 1, log_file = '~/efm.log' },
-- }--
--
-- lua lsp
--
local system_name = "Linux"

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
-- require("compe-setup")
--
local sumneko_root_path = "/home/adgai/github/lua-language-server/"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local library = vim.api.nvim_get_runtime_file("", true)
table.insert(library, "/usr/share/awesome/lib")
local opts = {
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	on_attach = require("lsp").on_attach,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = library,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = { enable = false },
		},
	},
}
require("lspconfig").sumneko_lua.setup(opts)
