local M = {}
local icons = require("core.icons")
local window_width_limit = 100

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.o.columns > window_width_limit
	end,
	-- check_git_workspace = function()
	--   local filepath = vim.fn.expand "%:p:h"
	--   local gitdir = vim.fn.finddir(".git", filepath .. ";")
	--   return gitdir and #gitdir > 0 and #gitdir < #filepath
	-- end,
}

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local colors = {
	bg = "#202328",
	fg = "#bbc2cf",
	yellow = "#ECBE7B",
	cyan = "#008080",
	darkblue = "#081633",
	green = "#98be65",
	orange = "#FF8800",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	purple = "#c678dd",
	blue = "#51afef",
	red = "#ec5f67",
}

M.mode = {
	-- mode component
	function()
		return ""
	end,
	color = function()
		-- auto change color according to neovims mode
		local mode_color = {
			n = colors.red,
			i = colors.green,
			v = colors.blue,
			[""] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		return { fg = mode_color[vim.fn.mode()] }
	end,
	colored = true,
	padding = { left = 1, right = 1 },
}

M.component = {
	mode = {
		-- 'mode',
		function()
			return " " .. icons.ui.Target .. " "
		end,
		padding = { left = 0, right = 0 },
		color = {},
		cond = nil,
	},
	diff = {
		"diff",
		colored = true,
		diff_color = {
			added = { fg = colors.green },
			modified = { fg = colors.yellow },
			removed = { fg = colors.red },
		},
		source = diff_source(),
		symbols = {
			added = icons.git.LineAdded .. " ",
			modified = icons.git.LineModified .. " ",
			removed = icons.git.LineRemoved .. " ",
		},
		padding = { left = 2, right = 1 },
		cond = nil,
	},
	diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = {
			error = icons.diagnostics.BoldError .. " ",
			warn = icons.diagnostics.BoldWarning .. " ",
			info = icons.diagnostics.BoldInformation .. " ",
			hint = icons.diagnostics.BoldHint .. " ",
		},
		colored = true,
		-- cond = conditions.hide_in_width,
	},
	treesitter = {
		function()
			return icons.ui.Tree
		end,
		color = function()
			local buf = vim.api.nvim_get_current_buf()
			local ts = vim.treesitter.highlighter.active[buf]
			return { fg = ts and not vim.tbl_isempty(ts) and colors.green or colors.red }
		end,
		cond = conditions.hide_in_width,
	},
	lsp = {
		function()
			local msg = ""
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and client.name ~= "null-ls" then
					return client.name
				end
			end
			return msg
		end,
		icon = icons.ui.Lsp,
		color = { fg = colors.orange, gui = "bold" },
	},
	encoding = {
		"o:encoding",
		fmt = string.upper,
		cond = conditions.hide_in_width,
		color = { fg = "#ffffff", gui = "bold" },
	},
	branch = {
		"branch",
		icon = icons.git.Branch,
		color = { fg = colors.violet, gui = "bold" },
	},
}

local options = {
	options = {
		icons_enabled = true,
		component_separators = {
			left = "",
			right = "",
		},
		section_separators = {
			left = "",
			right = "",
		},
		theme = "auto",
		disabled_filetypes = {
			statusline = {
				"dashboard",
				"Trouble",
				"quickfix",
				"DiffviewFiles",
				"lspsagaoutline",
				"NeogitStatus",
				"NeogitConsole",
				"help",
				"NeogitPopup",
				"DiffviewFileHistory",
				"NeogitCommitView",
			},
			-- winbar = { 'NvimTree', 'dashboard', 'Trouble', 'quickfix', 'DiffviewFiles', 'lspsagaoutline',
			--   'NeogitStatus', 'help' },
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000 / 30,
			-- tabline = 1000,
			-- winbar = 1000,
		},
	},

	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			M.mode,
			M.component.branch,
			M.component.diff,
			M.component.diagnostics,
			-- { navic.get_location, cond = navic.is_avaiable }
		},
		lualine_x = {
			M.component.lsp,
			M.component.encoding,
			"filetype",
			M.component.treesitter,
		},
		lualine_y = { "progress" },
		lualine_z = {},
	},

	inactive_sections = {
		lualine_a = {},
		lualine_b = {
			-- M.mode,
			-- M.component.branch,
			-- M.component.diff ,
			-- M.component.diagnostics,
		},
		lualine_c = { "filename" },
		lualine_x = {
			M.component.lsp,
			M.component.encoding,
			"filetype",
			M.component.treesitter,
		},
		lualine_y = {},
		lualine_z = {},
	},

	tabline = {},
	winbar = {},

	inactive_winbar = {},
	extensions = { "nvim-tree", "quickfix", "symbols-outline", "toggleterm", "man" },
}
-- M.filename = {
--   function()
--     local filename = vim.fn.expand "%:t"
--     local extensions = vim.fn.expand "%:e"
--     if filename == '' or filename == nil then
--       return ''
--     end

--     local file_icon, hl_group =
--     require('nvim-web-devicons').get_icon(filename, extensions, { default = true })

--     local navic_text = vim.api.nvim_get_hl_by_name("Normal", true)
--     vim.api.nvim_set_hl(0, "Winbar", { fg = navic_text.foreground })

--     return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" ..
--         " " .. "%#Winbar#" .. filename .. "%*"
--   end,
-- }

require("lualine").setup(options)
