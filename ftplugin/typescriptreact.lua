--local lspconfig = require("lspconfig")

--local prettier = require("efm/prettier")
--local eslint = require("efm/eslint")

--local on_attach = require("lsp").on_attach

---- TSServer Setup
--print("tsserver")
--lspconfig.tsserver.setup({
---- root_dir = lspconfig.util.root_pattern("yarn.lock","package.json", "lerna.json", ".git"),
---- settings = { documentFormatting = false },
--on_attach = on_attach,
--})

--require("lspconfig").eslint.setup({})
--vim.cmd([[autocmd CursorHold,CursorHoldI * lua require('code_action_utils').code_action_listener()]])
--local languages = {
--typescript = { prettier, eslint },
--javascript = { prettier, eslint },
--typescriptreact = { prettier, eslint },
--javascriptreact = { prettier, eslint },
--yaml = { prettier },
--json = { prettier },
--html = { prettier },
--scss = { prettier },
--css = { prettier },
--markdown = { prettier },
--}

--print("efm")
---- lspconfig.efm.setup {
----   root_dir = lspconfig.util.root_pattern("yarn.lock", "lerna.json", ".git"),
----   -- filestypes = vim.tbl_keys(languages),
----   -- init_options = { documentFormatting = true, codeAction = true },
----   -- settings = { languages = languages, log_level = 1, log_file = '~/efm.log' },
---- }--
local ts_utils = require("nvim-lsp-ts-utils")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

-- npm install -g typescript typescript-language-server
require("lspconfig").tsserver.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

		--local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
		--buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

		require("lsp").on_attach(client, bufnr)
		ts_utils.setup({
			debug = false,
			disable_commands = false,
			enable_import_on_completion = true,
			import_all_timeout = 5000, -- ms

			-- eslint
			eslint_enable_code_actions = false,
			eslint_enable_disable_comments = false,
			eslint_bin = "eslint_d",
			eslint_config_fallback = nil,
			eslint_enable_diagnostics = false,
			eslint_opts = {
				-- diagnostics_format = "#{m} [#{c}]",
				condition = function(utils)
					return utils.root_has_file(".eslintrc.js")
				end,
			},

			-- formatting
			--enable_formatting = false,
			--formatter = 'prettier_d_slim',
			--formatter_config_fallback = nil,

			-- parentheses completion
			complete_parens = true,
			signature_help_in_parens = false,

			-- update imports on file move
			update_imports_on_move = true,
			require_confirmation_on_move = true,
			watch_dir = nil,

			-- filter diagnostics
			filter_out_diagnostics_by_severity = { "hint" },
			filter_out_diagnostics_by_code = {},
		})

		ts_utils.setup_client(client)
	end,
})

vim.cmd([[augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]])
vim.cmd(" source $HOME/.config/nvim/abbriviations/react.vim")
