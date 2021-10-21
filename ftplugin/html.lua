local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}
capabilities=require('cmp_nvim_lsp').update_capabilities(capabilities)

capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").html.setup({ capabilities = capabilities })

require('cmp-setup')
