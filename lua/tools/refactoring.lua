return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-treesitter/nvim-treesitter" },
  },

  -- init = function()
  --   require("telescope").load_extension("refactoring")
  -- end,
  config = function()
    require("telescope").load_extension("refactoring")
    require("refactoring").setup({})
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
