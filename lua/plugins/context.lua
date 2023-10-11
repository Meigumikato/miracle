return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  { "folke/zen-mode.nvim", cmd = "ZenMode" },

  {
    "barrett-ruth/live-server.nvim",
    config = true,
    cmd = { "LiveServerStart", "LiveServerStop" },
  },
}
