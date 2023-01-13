local M = {
	["nvim-treesitter/nvim-treesitter"] = {
		cmd = require("core.lazy_load").treesitter_cmds,
		ft = { "c", "cpp", "lua", "go", "rust" },
		dependencies = {
			"p00f/nvim-ts-rainbow",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		config = require("modules.editor.config.treesitter"),
	},

	["kylechui/nvim-surround"] = {
		event = { "BufReadPost" },
		config = function()
			require("nvim-surround").setup()
		end,
	},

	["windwp/nvim-autopairs"] = {
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
			})
		end,
	},

	["numToStr/Comment.nvim"] = {
		event = { "BufReadPost" },
		config = function()
			require("Comment").setup()
		end,
	},

	["lukas-reineke/indent-blankline.nvim"] = {

		event = { "BufReadPre" },
		config = require("modules.editor.config.indentline"),
	},

	-- ["ggandor/leap.nvim"] = {
	--   event = "VeryLazy",
	--   dependencies = { { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } } },
	--   config = function(_, opts)
	--     local leap = require("leap")
	--     for k, v in pairs(opts) do
	--       leap.opts[k] = v
	--     end
	--     leap.add_default_mappings(true)
	--   end,
	-- },

	["echasnovski/mini.bufremove"] = {
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
	},
	["ggandor/leap.nvim"] = {
		event = "VeryLazy",
		dependencies = {
			{ "ggandor/flit.nvim", config = { labeled_modes = "nv" } },
		},
		config = function()
			require("leap").add_default_mappings(true)
		end,
	},
	["JoosepAlviste/nvim-ts-context-commentstring"] = {},
	["RRethy/vim-illuminate"] = {
		event = "BufReadPost",
		config = function()
			require("illuminate").configure({
				filetypes_denylist = {
					"NvimTree",
				},
				delay = 200,
			})
		end,
		keys = {
			{
				"]]",
				function()
					require("illuminate").goto_next_reference(false)
				end,
				desc = "Next Reference",
			},
			{
				"[[",
				function()
					require("illuminate").goto_prev_reference(false)
				end,
				desc = "Prev Reference",
			},
		},
	},
}

return M
