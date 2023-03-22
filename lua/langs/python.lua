-- vim.("python module load")
--
--
-- vim.notify("python module load", vim.log.levels.WARN)
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      ---@diagnostic disable-next-line: missing-parameter
      vim.list_extend(opts.ensure_installed, { "python" })
    end,
  },
  -- correctly setup mason lsp / dap extensions
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      vim.list_extend(opts.sources, {
        nls.builtins.formatting.black,
        nls.builtins.diagnostics.flake8,
      }, 1, 1)
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      ---@diagnostic disable-next-line: missing-parameter
      vim.list_extend(opts.ensure_installed, { "black", "pyright", "flake8" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        pyright = {
          -- gofumpt = true,
        },
      },
    },
  },
}
