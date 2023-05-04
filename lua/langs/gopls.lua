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
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      dap.adapters.go = {
        type = "executable",
        command = vim.fn.stdpath("data") .. "/mason/bin/go-debug-adapter",
        -- args = { os.getenv("HOME") .. "/dev/golang/vscode-go/dist/debugAdapter.js" },
      }
      dap.configurations.go = {
        {
          type = "go",
          name = "Debug",
          request = "launch",
          showLog = false,
          program = "${file}",
          dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
        },
        {
          name = "Connect to server",
          type = "go",
          request = "attach",
          -- debugAdapter = "dlv-dap",
          mode = "remote",
          -- remotePath = "${workspaceFolder}",
          host = "10.179.44.218",
          port = 8080,
          substitutePath = {
            { from = "${workspaceFolder}", to = "/root/duse_statistic" },
          },
          stopOnEntry = true,
          apiVersion = 1,
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      ---@diagnostic disable-next-line: missing-parameter
      vim.list_extend(opts.ensure_installed, { "gopls", "golangci-lint", "gofumpt", "goimports" })
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
