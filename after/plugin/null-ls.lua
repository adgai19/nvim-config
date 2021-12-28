local ls = require("null-ls")
local lsp = require("lspconfig")

ls.setup({
	sources = {
		ls.builtins.formatting.stylua,
		ls.builtins.diagnostics.eslint,

		ls.builtins.diagnostics.shellcheck,
		ls.builtins.formatting.goimports,
		ls.builtins.formatting.prettier,
		ls.builtins.completion.spell,
	},
})
