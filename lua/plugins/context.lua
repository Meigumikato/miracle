return {
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },
  { "shortcuts/no-neck-pain.nvim", event = "VeryLazy", version = "*" },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local c = opts.sections and opts.sections.lualine_c
      if c and #c > 0 then
        table.remove(c, #c)
      end
    end,
  },
  {
    "ramilito/kubectl.nvim",
    version = "2.*",
    dependencies = "saghen/blink.download",
    keys = { { "<leader>K", "<cmd>Kubectl<cr>", desc = "Kubectl" } },
    cmd = "Kubectl",
    opts = {},
  },
  {
    "A7lavinraj/assistant.nvim",
    keys = { { "<leader>ra", "<cmd>AssistantToggle<cr>", desc = "Toggle Assistant.nvim" } },
    opts = {},
  },
  { "nvzone/typr", cmd = "TyprStats", dependencies = "nvzone/volt", opts = {} },
  { "tris203/precognition.nvim", cmd = "Precognition", opts = {} },
  { "stevearc/dressing.nvim", enabled = false },
}
