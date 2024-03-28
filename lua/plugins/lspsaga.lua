return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.diagnostic.config({
        virtual_text = false,
      })

      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "gr", "<cmd>Lspsaga finder ref<cr>", desc = "Find reference" }
      keys[#keys + 1] = { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "Goto definition" }
      keys[#keys + 1] = { "<leader>ci", "<cmd>Lspsaga incoming_calls<cr>", desc = "Incoming calls" }
      keys[#keys + 1] = { "<leader>co", "<cmd>Lspsaga outgoing_calls<cr>", desc = "Outgoing calls" }
      keys[#keys + 1] = { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "code action" }
      keys[#keys + 1] = { "<leader>cr", "<cmd>Lspsaga rename<cr>" }
      keys[#keys + 1] = {
        "]e",
        function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
        end,
      }
      keys[#keys + 1] = {
        "[e",
        function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
        end,
      }
      keys[#keys + 1] = {
        "]w",
        function()
          require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.WARN })
        end,
      }
      keys[#keys + 1] = {
        "[w",
        function()
          require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.WARN })
        end,
      }
    end,
  },
  {

    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          enable = true,
        },
        finder = {
          max_height = 0.5,
          left_width = 0.3,
          right_withd = 0.3,
          default = "ref+imp+def",
          layout = "float",
          silent = false,
          keys = {
            shuttle = "[w",
            toggle_or_open = { "o", "<CR>" },
            vsplit = "v",
            split = "s",
            tabe = "t",
            tabnew = "r",
            quit = { "q", "<ESC>" },
            close = "<C-c>k",
          },
        },
        hover = {
          max_width = 0.8,
          max_height = 0.8,
          open_link = "gx",
          open_cmd = "!chrome",
        },
        code_action = {
          num_shortcut = true,
          show_server_name = false,
          extend_gitsigns = true,
          keys = {
            quit = "q",
            exec = "<CR>",
          },
        },
        implement = {
          enable = true,
          sign = true,
          virtual_text = true,
          priority = 100,
        },
        rename = {
          in_select = true,
          auto_save = true,
          project_max_width = 0.5,
          project_max_height = 0.5,
          keys = {
            quit = "<C-k>",
            exec = "<CR>",
            select = "x",
          },
        },
        diagnostic = {
          max_height = 0.8,
          keys = {
            quit = { "q", "<ESC>" },
          },
        },
        callhierarchy = {
          layout = "float",
          keys = {
            edit = "e",
            vsplit = "v",
            split = "s",
            tabe = "t",
            quit = { "q", "<ESC>" },
            shuttle = "[w",
            toggle_or_req = "u",
            close = "<C-c>k",
          },
        },
      })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
  },
}
