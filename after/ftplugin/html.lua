local lspconfig = require("lspconfig")
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

require("lspconfig").eslint.setup({})
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
require("lspconfig").html.setup({ capabilities = capabilities })

-- require("plcmp-setup")
