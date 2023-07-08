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
      colorscheme = "tokyonight",
    },
  },
}
