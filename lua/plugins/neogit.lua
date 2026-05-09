return {
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
  },
  {
    "NeogitOrg/neogit",
    keys = { { "<leader>gn", "<CMD>Neogit<CR>", desc = "neogit" } },
    opts = {
      integrations = {
        diffview = true,
      },
    },
    cmd = "Neogit",
    dependencies = {
      "sindrets/diffview.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
