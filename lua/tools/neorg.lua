return {
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     ---@diagnostic disable-next-line: missing-parameter
  --     vim.list_extend(opts.ensure_installed, { "org" })
  --     opts.highlight.additional_vim_regex_highlighting = { "org" }
  --   end,
  -- },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function(_, opts)
  --     local cmp = require("cmp")
  --     ---@diagnostic disable-next-line: missing-parameter
  --     opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "orgmode" } }))
  --   end,
  -- },
  -- {
  --   "nvim-orgmode/orgmode",
  --   config = function()
  --     require("orgmode").setup_ts_grammar()
  --     require("orgmode").setup({
  --       org_agenda_files = { "~/Notes/agenda/*" },
  --       org_default_notes_file = "~/Notes/note.org",
  --     })
  --   end,
  -- },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   -- dependencies = { "hrsh7th/cmp-emoji" },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     local cmp = require("cmp")
  --     ---@diagnostic disable-next-line: missing-parameter
  --     opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "neorg" } }))
  --   end,
  -- },
  --
  {
    "nvim-neorg/neorg",
    event = "VeryLazy",
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.journal"] = {
          config = {
            workspace = "notes",
          },
        },
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Notes",
            },
          },
        },
      },
    },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
}
