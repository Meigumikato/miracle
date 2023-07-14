return {
  {
    "p00f/clangd_extensions.nvim",
    opts = {
      extension = {
        inlay_hints = {
          inline = vim.fn.has("nvim-0.10") == 1,
        },
      },
    },
  },
}
