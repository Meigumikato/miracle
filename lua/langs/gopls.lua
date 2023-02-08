return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          ---@diagnostic disable-next-line: missing-parameter
          vim.list_extend(opts.ensure_installed, { "go" })
        end,
    },
    -- -- correctly setup mason lsp / dap extensions
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
          local nls = require("null-ls")
          vim.list_extend(opts.sources, {
              nls.builtins.diagnostics.golangci_lint,
          }, 1, 1)
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          ---@diagnostic disable-next-line: missing-parameter
          vim.list_extend(opts.ensure_installed, { "gopls", "golangci-lint" })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            -- make sure mason installs the server
            servers = {
                gopls = {
                    gofumpt = true,
                },
            },
        },
    },
}
