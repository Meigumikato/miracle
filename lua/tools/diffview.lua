return {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewFileHistory",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewRefresh",
  },
  config = function()
    require("diffview").setup({})
  end,
  dependencies = { "nvim-lua/plenary.nvim" },
}
