return {
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = true,
  --   config = function()
  --     require("gruvbox").setup({
  --       contrast = "hard",
  --     })
  --   end,
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      term_colors = true,
      transparent_background = false,
      no_italic = false,
      no_bold = false,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      highlight_overrides = {
        mocha = function(C)
          return {
            TabLineSel = { bg = C.pink },
            CmpBorder = { fg = C.surface2 },
            Pmenu = { bg = C.none },
            TelescopeBorder = { link = "FloatBorder" },
          }
        end,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      transparent = true,
    },
  },
  { "arturgoms/moonbow.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "moonbow",
    },
  },
}
