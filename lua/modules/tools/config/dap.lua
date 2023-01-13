local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

dap.adapters.go = {
	type = "executable",
	command = "go-debug-adapter",
	name = "godbg",
	-- args = { os.getenv("HOME") .. "/vscode-go/dist/debugAdapter.js" },
}

dap.adapters.rust = {
	type = "executable",
	command = "lldb-vscode",
	name = "rt_lldb",
}

require("dap.ext.vscode").load_launchjs(nil, { go = { "go" }, rust = { "lldb" } })

-- dap.configurations.rust = {
--   {
--     type = 'lldb';
--     name = 'rsdbg';
--     request = 'launch';
--     showLog = false;
--   },
-- }
