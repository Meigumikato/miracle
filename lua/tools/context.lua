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

  {
    { "rouge8/neotest-rust" },
    {
      "nvim-neotest/neotest",
      config = function(_, opts)
        opts.adapters = {
          require("neotest-rust")({
            args = { "--no-capture" },
          }),
        }
      end,
    },
  },
}
