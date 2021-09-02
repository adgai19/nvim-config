local M = {}
local last_gdb_config
local dap = require("dap")
vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
dap.configurations.cpp = {
	{
		name = "Launch",
		type = "cpp",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		env = function()
			local variables = {}
			for k, v in pairs(vim.fn.environ()) do
				table.insert(variables, string.format("%s=%s", k, v))
			end
			return variables
		end,
		stopOnEntry = false,
		args = {},
	},
}
dap.adapters.cpp = {

	type = "executable",
	name = "cppdbg",
	command = vim.api.nvim_get_runtime_file(
		"/autoload/plugged/vimspector/gadgets/linux/vscode-cpptools/debugAdapters/OpenDebugAD7",
		false
	)[1], --  // ensure that vimspector is located inside the nvim runtime folder
	args = {},
	attach = { pidProperty = "processId", pidSelect = "ask" },
}
M.start_c_debugger = function(args, mi_mode, mi_debugger_path)
	if args and #args > 0 then
		last_gdb_config = {
			type = "cpp",
			name = args[1],
			request = "launch",
			program = table.remove(args, 1),
			args = args,
			cwd = vim.fn.getcwd(),
			-- env = {"VAR1=value1", "VAR2=value"}, -- environment variables are set via `ENV_VAR_NAME=value` pairs
			externalConsole = true,
			MIMode = mi_mode or "gdb",
			MIDebuggerPath = mi_debugger_path,
		}
	end

	if not last_gdb_config then
		print('No binary to debug set! Use ":DebugC <binary> <args>" or ":DebugRust <binary> <args>"')
		return
	end

	dap.run(last_gdb_config)
	dap.repl.open()
end

return M
