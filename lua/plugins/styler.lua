return {
  {
    "folke/styler.nvim",
    lazy = true,
    opts = function(_, opts)
      opts.themes = {
        markdown = { colorscheme = "gruvbox" },
        help = { colorscheme = "catppuccin-mocha", background = "dark" },
        norg = { colorscheme = "tokyonight" },
      }
    end,
  },
}
