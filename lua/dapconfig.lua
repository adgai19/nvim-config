local dap_install = require("dap-install")

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
	verbosely_call_debuggers = true,
})

dap_install.config("ccppr_lldb_dbg", {})
dap_install.config("python_dbg", {})
dap_install.config("lua_dbg", {})
