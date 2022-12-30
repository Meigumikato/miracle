local options = {
  ensure_installed = { 'lua', 'c', 'cpp', 'rust' },
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,

      keymaps = {
        ["af"] = { query = "@function.outer",
          desc = "Select outer part of a function region" },
        ["if"] = { query = "@function.inner",
          desc = "Select inner part of a function region" },
        ["ac"] = { query = "@class.outer",
          desc = "Select outer part of a class region" },
        ["ic"] = { query = "@class.inner",
          desc = "Select inner part of a class region" },
      },

      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = true,
    },
  }
}
local function config()
  local treesitter_config = require('nvim-treesitter.configs')
  treesitter_config.setup(options)
end

return config
