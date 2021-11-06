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
--require("lsp")

-- require("plugins.cmp-setup")
vim.cmd([[autocmd CursorHold,CursorHoldI * lua require('lsp.code_action_utils').code_action_listener()]])
--local lsp = require("cmp.types.lsp")
