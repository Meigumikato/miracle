return {

  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { "gd", false }
      keys[#keys + 1] = { "gr", false }
      keys[#keys + 1] = { "<space>ca", false }
      keys[#keys + 1] = { "<space>cr", false }
      keys[#keys + 1] = { "[e", false }
      keys[#keys + 1] = { "]e", false }
      keys[#keys + 1] = { "[w", false }
      keys[#keys + 1] = { "]w", false }
      keys[#keys + 1] = { "[d", false }
      keys[#keys + 1] = { "]d", false }
      keys[#keys + 1] = { "gD", false }
      keys[#keys + 1] = { "gI", false }
    end,
  },

  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      lightbulb = {
        enable = false,
      },
      finder = {
        silent = true,
      },
    },
    config = function(_, opts)
      require("lazyvim.util").on_attach(function(client, buffer)
        vim.keymap.set(
          "n",
          "gd",
          "<CMD>Lspsaga goto_definition<CR>",
          { buffer = buffer, desc = "Lspsaga goto_definition" }
        )
        vim.keymap.set(
          "n",
          "gD",
          "<CMD>Lspsaga peek_definition<CR>",
          { buffer = buffer, desc = "Lspsaga peek_definition" }
        )
        vim.keymap.set("n", "gI", "<CMD>Lspsaga finder imp<CR>", { buffer = buffer, desc = "Lspsaga finder imp" })

        vim.keymap.set("n", "gr", "<CMD>Lspsaga finder<CR>", { buffer = buffer, desc = "Lspsaga finder" })

        if client.name ~= "taplo" or client.name ~= "rust_analyzer" then
          vim.keymap.set("n", "K", "<CMD>Lspsaga hover_doc<CR>", { buffer = buffer, desc = "Lspsaga hover_doc" })
        end

        vim.keymap.set("n", "<space>o", "<CMD>Lspsaga outline<CR>", { buffer = buffer, desc = "Lspsaga outline" })

        vim.keymap.set(
          "n",
          "<space>ca",
          "<CMD>Lspsaga code_action<CR>",
          { buffer = buffer, desc = "Lspsaga code_action" }
        )
        vim.keymap.set(
          "n",
          "<space>ci",
          "<CMD>Lspsaga incoming_calls<CR>",
          { buffer = buffer, desc = "Lspsaga incoming_calls" }
        )

        vim.keymap.set(
          "n",
          "<space>co",
          "<CMD>Lspsaga outgoing_calls<CR>",
          { buffer = buffer, desc = "Lspsaga outgoing_calls" }
        )

        vim.keymap.set(
          "n",
          "<space>csl",
          "<CMD>Lspsaga show_line_diagnostics<CR>",
          { buffer = buffer, desc = "Lspsaga showshow_line_diagnostics" }
        )

        vim.keymap.set(
          "n",
          "<space>csw",
          "<CMD>Lspsaga show_workspace_diagnostics<CR>",
          { buffer = buffer, desc = "Lspsaga show_workspace_diagnostics" }
        )

        vim.keymap.set(
          "n",
          "<space>csb",
          "<CMD>Lspsaga show_buf_diagnostics<CR>",
          { buffer = buffer, desc = "Lspsaga show_buf_diagnostics" }
        )

        vim.keymap.set(
          "n",
          "<space>csc",
          "<CMD>Lspsaga  show_cursor_diagnostics<CR>",
          { buffer = buffer, desc = "Lspsaga show_cursor_diagnostics" }
        )

        vim.keymap.set("n", "<space>cr", "<CMD>Lspsaga rename<CR>", { buffer = buffer, desc = "Lspsaga rename" })
        vim.keymap.set(
          "n",
          "]d",
          "<CMD>Lspsaga diagnostic_jump_next<CR>",
          { buffer = buffer, desc = "Lspsaga diagnostic_jump_next" }
        )
        vim.keymap.set(
          "n",
          "[d",
          "<CMD>Lspsaga diagnostic_jump_prev<CR>",
          { buffer = buffer, desc = "Lspsaga diagnostic_jump_prev" }
        )

        vim.keymap.set("n", "]w", function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.WARN })
        end, { buffer = buffer, desc = "Lspsaga warn_diagnostic_jump_next" })

        vim.keymap.set("n", "[w", function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.WARN })
        end, { buffer = buffer, desc = "Lspsaga warn_diagnostic_jump_prev" })

        vim.keymap.set("n", "]e", function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end, { buffer = buffer, desc = "Lspsaga error_diagnostic_jump_next" })

        vim.keymap.set("n", "[e", function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end, { buffer = buffer, desc = "Lspsaga error_diagnostic_jump_prev" })
      end)

      require("lspsaga").setup(opts)
    end,

    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
  {
    "SmiteshP/nvm-navic",
    enabled = false,
  },

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    config = true,
  },
}
