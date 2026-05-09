return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = { contrast = "hard" },
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    opts = {
      background = { light = "latte", dark = "mocha" },
      integrations = {
        aerial = true,
        which_key = true,
        neogit = true,
        neotree = true,
        noice = true,
      },
      color_overrides = {
        mocha = { base = "#000000", mantle = "#000000", crust = "#000000" },
      },
    },
  },
  { "rebelot/kanagawa.nvim", lazy = true, priority = 1000 },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = { style = "night" },
  },
  { "Meigumikato/moonbow.nvim", lazy = true },
  { "nyoom-engineering/oxocarbon.nvim", lazy = true },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
