local M = {}
local icons = require('core.icons')
local utils = require('core.utils')

local telescope = require('telescope')
local telescope_config = require('telescope.config')

local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }

table.insert(telescope_config, '--glob')
table.insert(telescope_config, '!**/.git/*')

M.options = {
  defaults = {
    prompt_prefix = icons.ui.Telescope .. " ",
    selection_caret = icons.ui.Forward .. " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.75,
      preview_cutoff = 120,
      horizontal = {
        preview_width = function(_, cols, _)
          if cols < 120 then
            return math.floor(cols * 0.5)
          end
          return math.floor(cols * 0.6)
        end,
        mirror = false,
      },
      vertical = { mirror = false },
    },
    vimgrep_arguments = vimgrep_arguments,
    ---@usage Mappings are fully customizable. Many familiar mapping patterns are setup as defaults.
    mappings = {
    },
    -- pickers = get_pickers(actions),
    file_ignore_patterns = {},
    path_display = { "smart" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,

  },
  pickers = {
    find_files = {
      find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
      theme = 'dropdown',
    }
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
  },
}

function M.setup()
  telescope.setup(M.options)
  telescope.load_extension('project')
  utils.load_mapping('telescope')
end

return M
