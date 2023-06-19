return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "neorg" } }))
    end,
  },

  { "folke/zen-mode.nvim" },

  { "simrat39/symbols-outline.nvim" },

  {
    "HiPhish/nvim-ts-rainbow2",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          opts.rainbow = {
            enable = true,
            disable = {},
            query = "rainbow-parens",
            strategy = require("ts-rainbow").strategy.global,
          }
        end,
      },
    },
  },
}
