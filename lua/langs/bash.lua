return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          ---@diagnostic disable-next-line: missing-parameter
          vim.list_extend(opts.ensure_installed, { "bash" })
        end,
    },
    -- -- correctly setup mason lsp / dap extensions
    {
        "jose-elias-alvarez/null-ls.nvim",
        opts = function(_, opts)
          local nls = require("null-ls")
          ---@diagnostic disable-next-line: missing-parameter
          vim.list_extend(opts.sources,
              {
                  nls.builtins.code_actions.shellcheck,
                  nls.builtins.formatting.shfmt,
              }
          )
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          ---@diagnostic disable-next-line: missing-parameter
          vim.list_extend(opts.ensure_installed, { "bash-language-server", "shellcheck", "shfmt" })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        opts = {
            -- make sure mason installs the server
            servers = {
                bashls = {
                },
            },
        },
    },
}
