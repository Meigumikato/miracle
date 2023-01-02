-- local telescope_config = require('telescope.config')

-- local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }

-- table.insert(vimgrep_arguments, '--glob')
-- table.insert(vimgrep_arguments, '!**/.git/*')

local function config()
  local icons = require('core.icons')
  require('telescope').setup {
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
      project = {
        base_dirs = {
          '~/Code/',
        --   {'~/dev/src2'},
        --   {'~/dev/src3', max_depth = 4},
        --   {path = '~/dev/src4'},
        --   {path = '~/dev/src5', max_depth = 2},
        },
        hidden_files = true, -- default: false
        theme = "dropdown",
        order_by = "asc",
        search_by = "title",
        sync_with_nvim_tree = true, -- default false
      },
      file_browser = {},
      dotfiles = {
        config_dir = '~/.config/nvim/init.lua',
      }
    }
  }

  require('telescope').load_extension('fzf')
  require("telescope").load_extension("file_browser")
  require('telescope').load_extension('project')
  require("telescope").load_extension("dotfiles")
end

return config
