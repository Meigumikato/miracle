local M = {}

local opts = {
	noremap = true,
	silent = true,
}

local util = require("utils")

vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- save in insert mode
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>")
vim.keymap.set("n", "<leader>ts", function() util.toggle("spell") end, { desc = "Spelling" })
vim.keymap.set("n", "<leader>tw", function() util.toggle("wrap") end, { desc = "Word Wrap" })
vim.keymap.set("n", "<leader>tn", function() util.toggle("relativenumber", true) util.toggle("number") end, { desc = "Line Numbers" })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

M.nmap = {
	["<A-h>"] = { "<C-w>h", "switch to left", opts },
	["<A-l>"] = { "<C-w>l", "switch to right", opts },
	["<A-j>"] = { "<C-w>j", "switch to down", opts },
	["<A-k>"] = { "<C-w>k", "switch to up", opts },

	["<leader>"] = {
		b = {
			name = "Buffer",
		},

		c = {
			name = "Code",
			-- a = { "<cmd>Lspsaga code_action<CR>", "Code Action", opts },
			-- f = { function() vim.lsp.buf.format { async = true } end, "Code Format", opts },
		},
		s = {
			name = "Search",
			t = {
				name = "TODO",
				-- t = { "<cmd>TODOTrouble<cr>", "TODO Trouble", opts },
			},
			-- w = { "<cmd>Telescope lsp_workspace_symbols", "Search Workspace", opts },
		},
		f = {
			name = "Find",
		},
		g = {
			name = "Git",
			d = {
				name = "DiffView",
				d = { "<cmd>DiffviewOpen<cr>", "open diffview", opts },
				x = { "<cmd>DiffviewClose<cr>", "close diffview", opts },
			},

      t = {
        name = "Telescope",
        -- c = {"<Cmd>Telescope git_commits<CR>", "git commit", opts},
        -- s = {"<Cmd>Telescope git_status<CR>", "git status", opts},
      }
		},
		o = {
			name = "Open",
			-- e = { "<cmd>NvimTreeToggle<cr>", "toggle nvimtree" },
			-- t = { function() util.float_term(nil, { cwd = util.get_root() }) end, "open floaterm(ROOT)", opts },
			T = { function() util.float_term() end, "open floaterm(cwd)", opts },
      t = { "<cmd>Lspsaga open_floaterm<CR>", "open floaterm", opts },
		},

    t = {
      name = "toggle",
    },
		h = {
			name = "Help",
			r = {
				name = "Update",
				r = {
					"<cmd>Lazy<cr>",
					"lazy",
				},
			},
			k = { "<cmd>Legendary keymaps<cr>", "search keymaps", opts },
      t = {
        name = "Telescope",
      --   a = {"<cmd>Telescope autocommands<cr>", "autocmd", opts },
      --   c = {"<cmd>Telescope commands<cr>", "commands", opts},
      --   f = {"<cmd>Telescope filetypes<cr>", "filetypes", opts},
      --   t = {"<cmd>Telescope help_tags<cr>", "help tags", opts},
      --   k = {"<cmd>Telescope keymaps<cr>", "keymaps", opts},
      --   o = {"<cmd>Telescope man_pages<cr>", "vim options", opts},
      --   h = {"<cmd>Telescope highlights<cr>", "highlights", opts},
      }
		},
		m = {
			name = "LSP Mode",
			-- f = { "<cmd>Lspsaga lsp_finder<CR>", 'Lspsaga finder', opts },
			-- r = { '<cmd>Lspsaga rename<cr>', "lsp rename", opts },
			o = { "<cmd>SymbolsOutline<cr>", "code outline", opts },
			i = {
				name = "LSP Mode Info",
				l = { "<cmd>LspInfo<cr>", "LSP Info", opts },
				n = { "<cmd>NullLsInfo<cr>", "Null-ls Info", opts },
			},
			d = {
				name = "LSP Diagnostics",
				-- c = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "lsp cursor diagnostics", opts },
				-- l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "lsp line diagnostics", opts },
				-- Lua
				-- t = { "<cmd>TroubleToggle<cr>", "TroubleToggle", opts },
				-- w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics", opts },
				-- d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics", opts },
				-- o = { "<cmd>TroubleToggle loclist<cr>", "Trouble Loclist", opts },
			},
		},
    p = {
      name = "Project",
    },
    w = {
      name = "Window | Workspace",
      w = { "<C-w>w", "switch window", opts },
    },
    q = {
      name = "Quit",
      q = {"<cmd>:qa<cr>", "Quit All", opts},
    }
	},
}

M.tmap = {
	["<A-d>"] = { [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], "toggle nvimtree", mode = "t", silent = true },
}

return M
