local M = {}

local function load_lazy()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"--single-branch",
			"https://github.com/folke/lazy.nvim.git",
			lazypath,
		})
	end
	vim.opt.runtimepath:prepend(lazypath)
end

local function convert_plugin_list(plugins)
	local res = {}
	for key, config in pairs(plugins) do
		config[1] = key
		res[#res + 1] = config
	end
	return res
end

local lazy_options = {
	spec = {
		-- import LazyVim plugins
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		-- import/override with your plugins
		{ import = "langs" },
		{ import = "ui" },
	},
	defaults = { lazy = true, version = "*" },
	install = { colorscheme = { "tokyonight", "habamax" } },
	checker = { enabled = true },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
}

function M:load_config()
	load_lazy()

	-- local modules_plugins = require("modules").plugins
	-- local startup_plugin_list = convert_plugin_list(modules_plugins)

	-- require("lazy").setup(startup_plugin_list, lazy_options)
	require("lazy").setup(lazy_options)

	-- gitsigns lazy load
	-- vim.api.nvim_create_autocmd({ "BufRead" }, {
	--     group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
	--     callback = function()
	--       vim.fn.system("git -C " .. vim.fn.expand "%:p:h" .. " rev-parse")
	--       if vim.v.shell_error == 0 then
	--         vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
	--         vim.schedule(function()
	--           -- require('lazy').load({"gitsigns.nvim"})
	--         end)
	--       end
	--     end,
	-- })
end

M.treesitter_cmds = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" }
M.mason_cmds = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" }

return M
