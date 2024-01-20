return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    -- priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
      })
    end,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    opts = {
      background = {
        light = "latte",
        dark = "mocha",
      },
      integrations = {
        aerial = true,
        which_key = true,
        neogit = true,
        neotree = true,
        noice = true,
      },
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
    },
  },

  { "rebelot/kanagawa.nvim" },
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
    "nyoom-engineering/oxocarbon.nvim",
    lazy = true,
    -- config = function()
    --   vim.opt.background = "dark" -- set this to dark or light
    --   vim.cmd("colorscheme oxocarbon")
    -- end,
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "moonbow",
      -- colorscheme = "kanagawa",
      -- colorscheme = "kanagawa-wave",
      -- colorscheme = "kanagawa-dragon",
      -- colorscheme = "kanagawa-lotus",
      colorscheme = "catppuccin",
    },
  },
}
