local persent, nvimtree = pcall(require, 'nvim-tree')
if not persent then
  return
end

local icons = require('core.icons')
-- local utils = require('core.utils')

local options =  { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = false,
  create_in_closed_folder = false,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  sort_by = "name",
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  on_attach = "disable",
  remove_keymaps = false,
  select_prompts = false,

  update_cwd = true,
  view = {
    -- adaptive_size = false,
    -- centralize_selection = false,
    -- width = 30,
    -- hide_root_folder = false,
    -- side = "left",
    -- preserve_window_proportions = false,
    -- number = false,
    -- relativenumber = false,
    signcolumn = "yes",
    -- mappings = {
    --   custom_only = false,
    --   list = {
    --     -- user mappings go here
    --   },
    -- },
    -- float = {
    --   enable = false,
    --   quit_on_focus_loss = true,
    --   open_win_config = {
    --     relative = "editor",
    --     border = "rounded",
    --     width = 30,
    --     height = 30,
    --     row = 1,
    --     col = 1,
    --   },
    -- },
  },
  renderer = {
    -- add_trailing = false,
    -- group_empty = false,
    -- highlight_git = false,
    -- full_name = false,
    -- highlight_opened_files = "none",
    -- root_folder_label = ":~:s?$?/..?",
    indent_width = 2,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      -- webdev_colors = true,
      -- git_placement = "before",
      -- padding = " ",
      -- symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = icons.ui.Text,
        symlink = icons.ui.FileSymlink,
        bookmark = "",
        folder = {
          default = icons.ui.Folder,
          empty = icons.ui.EmptyFolder,
          empty_open = icons.ui.EmptyFolderOpen,
          open = icons.ui.FolderOpen,
          symlink = icons.ui.FolderSymlink,
        },

        git = {
          unstaged = icons.git.FileUnstaged,
          staged = icons.git.FileStaged,
          unmerged = icons.git.FileUnmerged,
          renamed = icons.git.FileRenamed,
          untracked = icons.git.FileUntracked,
          deleted = icons.git.FileDeleted,
          ignored = icons.git.FileIgnored,
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_root = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  -- system_open = {
  --   cmd = "",
  --   args = {},
  -- },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = false,
    debounce_delay = 50,
    icons = {
      hint = icons.diagnostics.BoldHint,
      info = icons.diagnostics.BoldInformation,
      warning = icons.diagnostics.BoldWarning,
      error = icons.diagnostics.BoldError,
    },
  },
  filters = {
    dotfiles = false,
    custom = { "\\.git/", 'node_modules', '\\.cache' },
  },
  trash = {
    cmd = 'trash',
    require_confirm = true,
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 200,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = true,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
}

-- function M.setup()
nvimtree.setup(options)
-- end

-- return M
