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
  -- lazy.nvim
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
