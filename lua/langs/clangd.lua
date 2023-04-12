return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      ---@diagnostic disable-next-line: missing-parameter
      vim.list_extend(opts.ensure_installed, { "cpp", "c" })
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      ---@diagnostic disable-next-line: missing-parameter
      vim.list_extend(opts.ensure_installed, { "clangd", "clang-format", "cpplint" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "p00f/clangd_extensions.nvim",
      },
    },
    opts = {
      servers = {
        clangd = {},
      },
      setup = {
        clangd = function(_, opts)
          local clangd_opts = {
            server = {
              cmd = {
                "clangd",
                "--background-index",
                "--pch-storage=memory",
                -- You MUST set this arg ↓ to your c/cpp compiler location (if not included)!
                "--query-driver=/usr/local/bin/g++-*,/usr/local/opt/llvm/bin/clang*",
                "--clang-tidy",
                -- "--all-scopes-completion",
                "--completion-style=detailed",
                -- "--header-insertion-decorators",
                "--header-insertion=iwyu",
                "--offset-encoding=utf-16",
              },
              -- on_attach = require("modules.lang").on_attach,
              capabilities = opts.capabilities,
              single_file_support = true,
            },
          }
          require("clangd_extensions").setup(clangd_opts)
          return true
        end,
      },
    },
  },
}
