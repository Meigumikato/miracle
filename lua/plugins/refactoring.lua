return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },

  config = function(_, opts)
    -- require("telescope").load_extension("refactoring")
    require("refactoring").setup(opts)
    require("lazyvim.util").on_load("telescope.nvim", function()
      require("telescope").load_extension("refactoring")
    end)
  end,

  keys = {
    {
      "<leader>rr",
      "<esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
      desc = "refactoring",
      mode = { "v" },
      noremap = true,
    },
  },
}
