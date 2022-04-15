local ls = require("null-ls")

ls.setup({
	sources = {
		ls.builtins.formatting.stylua,
		ls.builtins.diagnostics.eslint.with({
        prefer_local = "node_modules/.bin",}),
		ls.builtins.formatting.google_java_format.with({
			extra_args = { "--aosp" },
		}),

    ls.builtins.diagnostics.write_good,
		ls.builtins.diagnostics.shellcheck,
		ls.builtins.formatting.goimports,
		ls.builtins.formatting.prettier.with({
        prefer_local = "node_modules/.bin",
		}),
		ls.builtins.completion.spell,
    ls.builtin.diagnostics.ansiblelint
	},
})
