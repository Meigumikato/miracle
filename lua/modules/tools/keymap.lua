local M = {}

M.telescope = {
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find in Files (Grep)" },
	{ "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
	{ "<leader>fd", "<cmd>Telescope file_browser<cr>", desc = "file_browser" },
	{ "<leader>gtc", "<Cmd>Telescope git_commits<CR>", desc = "commits" },
	{ "<leader>gts", "<Cmd>Telescope git_status<CR>", desc = "status" },
	{ "<leader>hta", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
	{ "<leader>htc", "<cmd>Telescope commands<cr>", desc = "Commands" },
	{ "<leader>htf", "<cmd>Telescope filetypes<cr>", desc = "File Types" },
	{ "<leader>hth", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
	{ "<leader>htk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
	{ "<leader>htm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
	{ "<leader>hto", "<cmd>Telescope vim_options<cr>", desc = "Options" },
	{ "<leader>hts", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
	{ "<leader>htt", "<cmd>Telescope builtin<cr>", desc = "Telescope" },
	{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
	{ "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
	{ "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
	{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
	{ "<leader>sm", "<cmd>Telescope lsp_workspace_symbols", desc = "Search Workspace" },
	{ "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
	{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
	{ "<leader>pp", "<cmd>Telescope project<cr>", desc = "project" },
	{ "<leader>wl", "<cmd>Telescope workspaces<cr>", desc = "Workspace List" },
}

M.trouble = {
	{ "<leader>stt", "<cmd>TODOTrouble<cr>", desc = "TODO Trouble" },
	{ "<leader>mdt", "<cmd>TroubleToggle<cr>", desc = "TroubleToggle" },
	{ "<leader>mdw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
	{ "<leader>mdd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
	{ "<leader>mdo", "<cmd>TroubleToggle loclist<cr>", desc = "Trouble Loclist" },
}

M.workspace = {
	{ "<leader>wa", "<cmd>WorkspacesAdd<cr>", desc = "Workspace Add" },
	{ "<leader>wd", "<cmd>WorkspacesRemove<cr>", desc = "Workspace Remove" },
}

M.dap = {
	{
		"<leader>dl",
		function()
			require("dap").launch()
		end,
		desc = "DAP launch",
	},
	{
		"<leader>dd",
		function()
			require("dap").teminate()
		end,
		desc = "DAP launch",
	},
	{
		"<leader>dr",
		function()
			require("dap").run()
		end,
		desc = "DAP run",
	},
	{
		"<leader>dc",
		function()
			require("dap").continue()
		end,
		desc = "DAP contine",
	},
	{
		"<leader>dsi",
		function()
			require("dap").step_into()
		end,
		desc = "DAP step into",
	},
	{
		"<leader>dso",
		function()
			require("dap").step_out()
		end,
		desc = "DAP step into",
	},
	{
		"<leader>dsx",
		function()
			require("dap").step_over()
		end,
		desc = "DAP step over",
	},
	{
		"<leader>dba",
		function()
			require("dap").toggle_breakpoint()
		end,
		desc = "DAP toggle breakpoint",
	},
	{
		"<leader>dbd",
		function()
			require("dap").clear_breakpoints()
		end,
		desc = "DAP clear breakpoint",
	},
	{
		"<leader>dbl",
		function()
			require("dap").list_breakpoints()
		end,
		desc = "DAP clear breakpoint",
	},
}

return M
