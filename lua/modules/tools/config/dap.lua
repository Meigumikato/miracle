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
	-- args = { os.getenv("HOME") .. "/vscode-go/dist/debugAdapter.js" },
}
require("dap.ext.vscode").load_launchjs(nil, { go = { "go" } })

-- dap.configurations.go = {
--   {
--     type = 'go';
--     name = 'Debug';
--     request = 'launch';
--     showLog = false;
--     program = "${file}";
--     dlvToolPath = vim.fn.exepath('dlv')  -- Adjust to where delve is installed
--   },
-- }
