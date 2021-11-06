local lspconfig = require("lspconfig")

local prettier = require("efm/prettier")
local eslint = require("efm/eslint")

local on_attach = require("lsp").on_attach

-- TSServer Setup
print("tsserver")
lspconfig.tsserver.setup({
	-- root_dir = lspconfig.util.root_pattern("yarn.lock","package.json", "lerna.json", ".git"),
	-- settings = { documentFormatting = false },
	on_attach = on_attach,
})

require("lspconfig").eslint.setup({})
vim.cmd([[autocmd CursorHold,CursorHoldI * lua require('lsp.code_action_utils').code_action_listener()]])
local languages = {
	typescript = { prettier, eslint },
	javascript = { prettier, eslint },
	typescriptreact = { prettier, eslint },
	javascriptreact = { prettier, eslint },
	yaml = { prettier },
	json = { prettier },
	html = { prettier },
	scss = { prettier },
	css = { prettier },
	markdown = { prettier },
}

print("efm")
-- lspconfig.efm.setup {
--   root_dir = lspconfig.util.root_pattern("yarn.lock", "lerna.json", ".git"),
--   -- filestypes = vim.tbl_keys(languages),
--   -- init_options = { documentFormatting = true, codeAction = true },
--   -- settings = { languages = languages, log_level = 1, log_file = '~/efm.log' },
-- }--
