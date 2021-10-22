local signs = {
	Error = " ",
	Warning = " ",
	Hint = " ",
	Information = " ",
}
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = {
		source = "always", -- Or "if_many"
	},
})
for type, icon in pairs(signs) do
	local hl = "LspDiagnosticsSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
vim.api.nvim_command("highlight! link LspDiagnosticsError DiffDelete")
vim.api.nvim_command("highlight! link LspDiagnosticsWarning DiffChange")
vim.api.nvim_command("highlight! link LspDiagnosticsHint NonText")

local on_attach = function(client, bufnr)
	local resolved_capabilities = client.resolved_capabilities

	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	-- Mappings.
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	if resolved_capabilities.document_highlight then
		vim.api.nvim_command([[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]])
		vim.api.nvim_command([[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]])
		vim.api.nvim_command([[autocmd CursorMoved <buffer> lua vim.lsp.util.buf_clear_references()]])
	end
end
-- INFO think i don't need this with cmp and lspkind
-- vim.lsp.protocol.CompletionItemKind = {
--   "   (Text) ",
--   "   (Method)",
--   "   (Function)",
--   "   (Constructor)",
--   " ﴲ  (Field)",
--   "[] (Variable)",
--   "   (Class)",
--   " ﰮ  (Interface)",
--   "   (Module)",
--   " 襁 (Property)",
--   "   (Unit)",
--   "   (Value)",
--   " 練 (Enum)",
--   "   (Keyword)",
--   "   (Snippet)",
--   "   (Color)",
--   "   (File)",
--   "   (Reference)",
--   "   (Folder)",
--   "   (EnumMember)",
--   " ﲀ  (Constant)",
--   " ﳤ  (Struct)",
--   "   (Event)",
--   "   (Operator)",
--   "   (TypeParameter)",
-- }
-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
-- require("lspinstall").post_install_hook = function()
--   setup_servers() -- reload installed servers
--   vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end
-- TODO move this to ft or somewhere else
-- require("lspconfig").gopls.setup({})
-- require("lspconfig").texlab.setup({
--   cmd = { "texlab" },
--   filetypes = { "tex", "bib" },
--
--   settings = {
--     texlab = {
--       auxDirectory = ".",
--       bibtexFormatter = "texlab",
--       build = {
--         args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
--         executable = "latexmk",
--         forwardSearchAfter = false,
--         onSave = false,
--       },
--       chktex = { onEdit = false, onOpenAndSave = false },
--       diagnosticsDelay = 300,
--       formatterLineLength = 80,
--       forwardSearch = { args = {} },
--       latexFormatter = "latexindent",
--       latexindent = { modifyLineBreaks = false },
--     },
--   },
-- })
require("lspconfig").vimls.setup({})

--vim.lsp.handlers["textDocument/codeAction"] = require("lsputil.codeAction").code_action_handler
vim.lsp.handlers["textDocument/references"] = require("lsputil.locations").references_handler
vim.lsp.handlers["textDocument/definition"] = require("lsputil.locations").definition_handler
vim.lsp.handlers["textDocument/declaration"] = require("lsputil.locations").declaration_handler
vim.lsp.handlers["textDocument/typeDefinition"] = require("lsputil.locations").typeDefinition_handler
vim.lsp.handlers["textDocument/implementation"] = require("lsputil.locations").implementation_handler
vim.lsp.handlers["textDocument/documentSymbol"] = require("lsputil.symbols").document_handler
vim.lsp.handlers["workspace/symbol"] = require("lsputil.symbols").workspace_handler
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = true,
	virtual_text = {
		spacing = 4,
		prefix = "●",
	},
	severity_sort = true,
})
return { on_attach = on_attach }
