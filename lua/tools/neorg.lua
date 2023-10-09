return {
  {
    "nvim-neorg/neorg",
    cmd = "Neorg",
    ft = "norg",
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        -- ["core.ui.calendar"] = {},
        ["core.export"] = {},
        ["core.export.markdown"] = {},
        ["core.concealer"] = {
          config = {
            -- icon_preset = "diamond",
          },
        }, -- Adds pretty icons to your documents
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
            -- name = "[Norg]",
          },
        },
        ["core.esupports.metagen"] = {
          config = {
            -- type = "auto",
            -- update_date = true,
          },
        },
        ["core.keybinds"] = {
          config = {
            default_keybinds = true,
            neorg_leader = "<Leader>n",
          },
        },
        ["core.journal"] = {
          config = {
            workspace = "notes",
          },
        },
        ["core.presenter"] = {
          config = {
            zen_mode = "zen-mode",
          },
        },
        ["core.summary"] = {},
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Notes",
              works = "~/Works",
            },
          },
        },

        ["core.integrations.telescope"] = {},
      },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
      { "nvim-neorg/neorg-telescope" },
    },
  },
  -- {
  --   "lukas-reineke/headlines.nvim",
  --   ft = "norg",
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   config = true, -- or `opts = {}`
  -- },
}
