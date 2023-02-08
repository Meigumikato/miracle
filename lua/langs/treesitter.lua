return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = {},
    ft = { "vim" },
    opts = function(_, opts)
      ---@diagnostic disable-next-line: missing-parameter
      vim.list_extend(opts.ensure_installed, { "vim" })
    end,
  },
}
