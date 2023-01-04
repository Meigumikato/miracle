local M = {}

local opts = {
	noremap = true,
	silent = true,
}

M.nmap = {
	["<C-h>"] = { "<C-w>h", "switch to left", opts },
	["<C-l>"] = { "<C-w>l", "switch to right", opts },
	["<C-j>"] = { "<C-w>j", "switch to down", opts },
	["<C-k>"] = { "<C-w>k", "switch to up", opts },

	-- ['gp'] = { '<cmd>Lspsaga peek_definition<cr>', "peek definition", opts },
	-- ["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "diagnostic_jump_prev", opts },
	-- ["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "diagnostic_jump_next", opts },

	-- ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "hover doc", opts },
  -- ['<leader>,'] = {"<cmd>Telescope buffers show_all_buffers=true<cr>", "search buffers", opts},
	["<leader>"] = {
		b = {
			name = "Buffer",
			-- l = { "<cmd>BufferLineCycleNext<cr>", "Goto Next Buffer", opts },
			-- h = { "<cmd>BufferLineCyclePrev<cr>", "Goto Prev Buffer", opts },
			-- d = { "<cmd>bd<cr>", "Close Current Buffer", opts },
			-- s = { "<cmd>BufferLinePick<cr>", "Pick Buffer", opts },
			-- p = { "<cmd>BufferLineTogglePin<cr>", "Pin Current Buffer", opts },
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
			-- f = { "<cmd>Telescope find_files<cr>", "find files", opts },
			-- g = { "<cmd>Telescope live_grep<cr>", "live grep", opts },
			-- b = { "<cmd>Telescope buffers<cr>", "find buffers", opts },
			-- h = { "<cmd>Telescope help_tags<cr>", "find help tags", opts },
			-- d = { "<cmd>Telescope file_browser<cr>", "file_browser", opts },
			-- r = { "<cmd>Telescope oldfiles<cr>", "recent file", opts },
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
			t = { "<cmd>Lspsaga open_floaterm<CR>", "open floaterm", opts },
			g = { "<cmd>Lspsaga open_floaterm lazygit<CR>", "open lazygit", opts },
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
      name = "Workspace",
    }
	},
}

M.tmap = {
	["<A-d>"] = { [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], "toggle nvimtree", mode = "t", silent = true },
}

return M
