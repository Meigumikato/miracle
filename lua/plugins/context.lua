return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "barrett-ruth/live-server.nvim",

    config = true,
    -- build = "yarn global add live-server",
    -- cmd = { "LiveServerStart", "LiveServerStop" },
  },
  {
    "NeogitOrg/neogit",
    opts = {
      integrations = {
        diffview = true,
      },
    },
    cmd = "Neogit",
    dependencies = "nvim-lua/plenary.nvim",
  },
}
