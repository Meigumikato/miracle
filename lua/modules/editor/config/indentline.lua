
local options = {
	active = true,
	on_config_done = nil,
	options = {
		enabled = true,
		buftype_exclude = { "terminal", "notify" },
		filetype_exclude = {
			"help",
			"startify",
			"dashboard",
			"packer",
			"lazy",
			"neogitstatus",
			"NvimTree",
			"Trouble",
			"text",
		},
		char = "│",
		-- char = icons.ui.LineLeft,
		show_trailing_blankline_indent = false,
		show_first_indent_level = true,
		use_treesitter = true,
		show_current_context = true,
	},
}

local function config()
	vim.opt.list = true

	require("indent_blankline").setup(options)
end

return config
