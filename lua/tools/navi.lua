return {
  {
    "SmiteshP/nvm-navic",
    enabled = false,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.theme = "auto"
      opts.sections.lualine_c = vim.list_slice(opts.sections.lualine_c, 1, 3)
    end,
  },
}
