local ls = require("null-ls")

ls.setup({
	sources = {
		ls.builtins.formatting.stylua,
		ls.builtins.diagnostics.eslint,
		ls.builtins.formatting.google_java_format.with({
			extra_args = { "--aosp" },
		}),

		ls.builtins.diagnostics.shellcheck,
		ls.builtins.formatting.goimports,
		ls.builtins.formatting.prettier,
		ls.builtins.completion.spell,
	},
})
