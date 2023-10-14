return {
  {
    "NeogitOrg/neogit",
    keys = { { "<leader>gn", "<CMD>Neogit<CR>", desc = "neogit" } },
    opts = {
      integrations = {
        diffview = true,
      },
    },
    cmd = "Neogit",
    dependencies = "nvim-lua/plenary.nvim",
  },
}
