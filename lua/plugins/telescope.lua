-- local telescope = require('telescope')

local icons = require('core.icons')

-- local telescope_config = require('telescope.config')

-- local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }

-- table.insert(vimgrep_arguments, '--glob')
-- table.insert(vimgrep_arguments, '!**/.git/*')

-- preload assistant plugin
-- vim.api.nvim_command("packadd telescope-fzf-native.nvim")
-- vim.api.nvim_command("packadd telescope-file-browser.nvim")

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    prompt_prefix = icons.ui.Telescope .. " ",
    selection_caret = icons.ui.Forward .. " ",
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    -- project = {
    --   -- base_dirs = {
    --   --   '~/dev/src',
    --   --   {'~/dev/src2'},
    --   --   {'~/dev/src3', max_depth = 4},
    --   --   {path = '~/dev/src4'},
    --   --   {path = '~/dev/src5', max_depth = 2},
    --   -- },
    --   hidden_files = true, -- default: false
    --   theme = "dropdown",
    --   order_by = "asc",
    --   search_by = "title",
    --   sync_with_nvim_tree = true, -- default false
    -- }
    file_browser = {},
  }
}

require('telescope').load_extension('fzf')
require("telescope").load_extension("file_browser")
require('telescope').load_extension('project')

local options = {
  defaults = {
    -- prompt_prefix = icons.ui.Telescope .. " ",
    -- selection_caret = icons.ui.Forward .. " ",
    -- entry_prefix = "  ",
    -- initial_mode = "insert",
    -- selection_strategy = "reset",
    -- sorting_strategy = "descending",
    -- layout_strategy = "horizontal",
    -- layout_config = {
    --   width = 0.75,
    --   preview_cutoff = 120,
    --   horizontal = {
    --     preview_width = function(_, cols, _)
    --       if cols < 120 then
    --         return math.floor(cols * 0.5)
    --       end
    --       return math.floor(cols * 0.6)
    --     end,
    --     mirror = false,
    --   },
    --   vertical = { mirror = false },
    -- },
    -- vimgrep_arguments = vimgrep_arguments,
    ---@usage Mappings are fully customizable. Many familiar mapping patterns are setup as defaults.
    -- mappings = {
    --   ["<C-h>"] = "which_key",
    -- },

    -- file_ignore_patterns = {},
    -- path_display = { "smart" },
    -- winblend = 0,
    -- border = {},
    -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    -- color_devicons = true,
    -- set_env = { ["COLORTERM"] = "truecolor" },
    -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    -- grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    -- qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- file_sorter = require('telescope.sorters').get_fuzzy_file,
    -- generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    -- -- Developer configurations: Not meant for general override
    -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,

  },
  pickers = {
    -- find_files = {
    --   find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
    --   theme = 'dropdown',
    -- }
  },
  extensions = {
    -- fzf = {
    --   fuzzy = true, -- false will only do exact matching
    --   override_generic_sorter = true, -- override the generic sorter
    --   override_file_sorter = true, -- override the file sorter
    --   case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    -- },
  },
}

-- require('telescope').setup(options)
-- telescope.setup(options)

