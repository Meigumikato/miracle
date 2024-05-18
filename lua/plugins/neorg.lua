return {
  { "folke/zen-mode.nvim", cmd = "ZenMode" },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",
    ft = "norg",
    dependencies = { "vhyrro/luarocks.nvim" },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Notes",
            },
            default_workspace = "notes",
          },
        },
      },
    },
  },

  -- {
  --   "lukas-reineke/headlines.nvim",
  --   ft = "norg",
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   config = true, -- or `opts = {}`
  -- },
}
