local lsp_installer = require("nvim-lsp-installer")
local servers = {
	"bashls",
	"ccls",
	"clangd",
	"eslint",
	"tsserver",
	"cssls",
	"pyright",
	"vuels",
	"html",
	"jsonls",
	"yamlls",
	"vimls",
}

for _, name in pairs(servers) do
	local ok, server = lsp_installer.get_server(name)
	-- Check that the server is supported in nvim-lsp-installer
	if ok then
		if not server:is_installed() then
			print("Installing " .. name)
			server:install()
		end
	end
end
