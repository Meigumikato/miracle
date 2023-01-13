local M = {

	["p00f/clangd_extensions.nvim"] = {
		ft = { "cpp", "c" },
		config = function()
			require("modules.lang.config.clangd")
		end,
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
	-- use 'simrat39/rust-tools.nvim'
	-- use 'kdarkhan/rust-tools.nvim'
	["saecki/crates.nvim"] = {
		event = { "BufReadPost Cargo.toml" },
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			-- vim.api.nvim_create_autocmd("InsertEnter", {
			-- 	group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
			-- 	pattern = "Cargo.toml",
			-- 	callback = function()
			-- 		require("cmp").setup.buffer({ sources = { { name = "crates" } } })
			-- 	end,
			-- })
			require("crates").setup()
		end,
	},
	["kdarkhan/rust-tools.nvim"] = {
		ft = { "rust" },
		config = function()
			require("modules.lang.config.rust_analyzer")
		end,
		dependencies = {
			"neovim/nvim-lspconfig",
			-- "saecki/crates.nvim",
		},
	},
	["ray-x/go.nvim"] = {
		ft = { "go" },
		config = function()
			require("modules.lang.config.gopls")
		end,
		dependencies = {
			"neovim/nvim-lspconfig",
			{ "ray-x/guihua.lua", build = "cd lua/fzy && make" },
		},
	},
}

return M
