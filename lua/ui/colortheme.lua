return {
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = true,
  --   -- priority = 1000,
  --   config = function()
  --     require("gruvbox").setup({
  --       contrast = "hard",
  --     })
  --   end,
  -- },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    opts = {
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      style = "night",
      -- transparent = true,
    },
  },
  {
    "Meigumikato/moonbow.nvim",
    lazy = true,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "moonbow",
      colorscheme = "catppuccin",
    },
  },
}
