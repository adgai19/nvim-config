local ls = require("null-ls")
local lsp = require("lspconfig")

ls.config({
	sources = {
		ls.builtins.formatting.stylua,
		ls.builtins.formatting.prettier,
		ls.builtins.formatting.eslint,
		ls.builtins.formatting.goimports,
		ls.builtins.diagnostics.shellcheck,
		-- ls.builtins.code_actions,
	},
	debug = true,
})
lsp["null-ls"].setup({})
