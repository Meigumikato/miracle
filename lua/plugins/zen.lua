return {
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    keys = { { "<leader>uz", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
    opts = {
      window = {
        width = 120,
        options = { signcolumn = "no", number = false, relativenumber = false, cursorline = false },
      },
      plugins = { twilight = { enabled = true }, tmux = { enabled = true } },
    },
  },
  {
    "folke/twilight.nvim",
    cmd = "Twilight",
    opts = { dimming = { alpha = 0.25 } },
  },
}
