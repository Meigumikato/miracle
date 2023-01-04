local M = {
["nvim-telescope/telescope.nvim"] = {
		tag = "0.1.0",
		cmd = { "Telescope" },
    keys = require('modules.tools.keymap').telescope,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-project.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"alex-laycalvert/telescope-dotfiles.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		config = require("modules.tools.config.telescope"),
	},

	["folke/which-key.nvim"] = {
		event = "VeryLazy",
		dependencies = {
			"mrjones2014/legendary.nvim",
		},
		config = require("modules.tools.config.whichkey"),
	},
	["mrjones2014/legendary.nvim"] = {
		event = "VeryLazy",
		config = require("modules.tools.config.legendary"),
	},

	["williamboman/mason-lspconfig.nvim"] = {
		cmd = { "LspInstall", "LspUnistall" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"sumneko_lua",
					"rust_analyzer",
					"clangd",
				},
			})
		end,
	},

	["williamboman/mason.nvim"] = {
		cmd = require("core.lazy_load").mason_cmds,
		config = function()
			require("mason").setup()
		end,
	},

	-- ["kevinhwang91/nvim-bqf"] = {
	-- 	ft = "qf",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- },

	["jose-elias-alvarez/null-ls.nvim"] = {
		event = { "LspAttach" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				debug = false,
				sources = {
					-- nuls_ls.builtins.formatting.clang_format,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.gofumpt,
					-- lint
					null_ls.builtins.diagnostics.golangci_lint,
				},
			})
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	["folke/trouble.nvim"] = {
		cmd = { "Trouble", "TroubleRefresh", "TroubleToggle" },
    keys = require('modules.tools.keymap').trouble,
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				auto_close = true,
				use_diagnostic_signs = true,
			})
		end,
	},

	["lewis6991/gitsigns.nvim"] = {
		event = "BufReadPost",
		config = function()
			require("modules.tools.config.gitsign")
		end,
	},

	["sindrets/diffview.nvim"] = {
		cmd = {
			"DiffviewOpen",
			"DiffviewClose",
			"DiffviewFileHistory",
			"DiffviewToggleFiles",
			"DiffviewFocusFiles",
			"DiffviewRefresh",
		},
		config = function()
			require("diffview").setup({
				-- hooks = {
				--   view_opened = function()
				--     vim.notify('hideline', vim.log.levels.INFO)
				--     require('lualine').hide {
				--       unhide = false,
				--     }
				--   end,
				--   view_closed = function()
				--     vim.notify('restoreline', vim.log.levels.INFO)
				--     require('lualine').hide {
				--       unhide = true,
				--     }
				--   end
				-- }
			})
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	["TimUntersberger/neogit"] = {
		cmd = { "Neogit" },
		config = function()
      require('neogit').setup{
        kind = "replace",
        disable_context_highlighting = false,
        integrations = { diffview = true },
        use_magit_keybindings = true,
        signs = {
          -- { CLOSED, OPENED }
          section = { "", "" },
          item = { "", "" },
          hunk = { "", "" },
        },
		  }

      vim.notify('kDiffAddHighlight', vim.log.levels.INFO)
      vim.api.nvim_set_hl(0, 'NeogitDiffAddHighlight', { fg = "#0e1000", bg = "#008000" })
      -- vim.api.nvim_set_hl(0, 'Comment', { fg = "#111111", bold = true })
      -- vim.api.nvim_set_hl(0, 'Error', { fg = "#ffffff", undercurl = true })
      -- vim.api.nvim_set_hl(0, 'Cursor', { reverse = true })
      vim.cmd [[
        hi def link NeogitDiffAddHighlight kDiffAddHighlight
        " hi def linkNeogitDiffDeleteHighlight guibg=#0e1000 guifg=#ff0000
        " hi def NeogitDiffContextHighlight guibg=#0e1000 guifg=#b2b2b2
        " hi def NeogitHunkHeader guifg=#cccccc guibg=#404040
        " hi def NeogitHunkHeaderHighlight guifg=#cccccc guibg=#4d4d4d
      ]]
    end,
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
		},

		dependencies = {
			"sindrets/diffview.nvim",
		},
	},
	["NvChad/nvim-colorizer.lua"] = {
		cmd = {'ColorizerToggle'},
		config = function()
      require 'colorizer'.setup()
    end,
	},

  ["rcarriga/nvim-dap-ui"] = {
    lazy = true,
  },
  ['mfussenegger/nvim-dap'] = {
    lazy = true,
    config = function()
      require('modules.tools.config.dap')
    end
  },
  ["natecraddock/workspaces.nvim"] = {
    cmd = {'WorkspacesList', 'WorkspacesAdd', 'WorkspacesRemove', 'WorkspacesOpen'},
    config = function()
      require("workspaces").setup({
          hooks = {
              open = { "bufdo bdelete", "NvimTreeToggle", "Telescope find_files" },
          }
      })
    end,
    keys = require('modules.tools.keymap').workspace,
  }
}

return M
