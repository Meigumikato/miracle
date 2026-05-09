return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      scroll = { enabled = false },
      image = { enabled = true },
      statuscolumn = { enabled = true },
      git = { enabled = true },
      words = { enabled = true },
      notifier = { enabled = true, timeout = 3000 },
      rename = { enabled = true },
      indent = { enabled = true, animate = { enabled = false } },
    },
    keys = {
      {
        "<leader>gB",
        function()
          Snacks.git.blame_line()
        end,
        desc = "Git blame line",
      },
      {
        "<leader>un",
        function()
          Snacks.notifier.show_history()
        end,
        desc = "Notification history",
      },
      {
        "<leader>cR",
        function()
          Snacks.rename.rename_file()
        end,
        desc = "Rename file (LSP)",
      },
      {
        "]]",
        function()
          Snacks.words.jump(vim.v.count1)
        end,
        desc = "Next reference",
        mode = { "n", "t" },
      },
      {
        "[[",
        function()
          Snacks.words.jump(-vim.v.count1)
        end,
        desc = "Prev reference",
        mode = { "n", "t" },
      },
    },
  },
}
