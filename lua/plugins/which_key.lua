return {
  {
    "folke/which-key.nvim",
    opts = {
      window = {
        border = "none",
        position = "bottom",
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      },
      layout = {
        height = { min = 4, max = 20 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 1, -- spacing between columns
        align = "center", -- align columns left, center or right
      },
    },
  },
}
