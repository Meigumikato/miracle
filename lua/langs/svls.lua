return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      ---@diagnostic disable-next-line: missing-parameter
      vim.list_extend(opts.ensure_installed, { "verilog" })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      ---@diagnostic disable-next-line: missing-parameter
      vim.list_extend(opts.sources, {
        nls.builtins.formatting.verible_verilog_format,
        -- nls.builtins.formatting.verible_verilog_format,
        -- nls.builtins.diagnostics.verilator,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      ---@diagnostic disable-next-line: missing-parameter
      vim.list_extend(opts.ensure_installed, { "svls", "verible" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        svls = {},
      },
    },
  },
}
