return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      ---@diagnostic disable-next-line: missing-parameter
      vim.list_extend(opts.ensure_installed, { "cmake" })
    end,
  },
  -- -- correctly setup mason lsp / dap extensions
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      ---@diagnostic disable-next-line: missing-parameter
      vim.list_extend(opts.sources, {
        nls.builtins.diagnostics.cmake_lint,
        nls.builtins.formatting.gersemi,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      ---@diagnostic disable-next-line: missing-parameter
      vim.list_extend(opts.ensure_installed, { "gersemi", "cmakelang" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        neocmake = {},
      },
    },
  },
}
