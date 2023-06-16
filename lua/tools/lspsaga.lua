return {
  {
    "glepnir/lspsaga.nvim",
    -- enabled = ,
    event = "BufRead",
    -- config = function()
    --   require("lspsaga").setup({
    --     lightbulb = {
    --       enable = false,
    --     }
    --   })
    -- end,
    opts = {
      lightbulb = {
        enable = false,
      },
    },
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
    keys = {
      { "gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "lspsaga lsp_finder" },

      -- Code action
      -- { "<leader>ca", "<cmd>Lspsaga code_action<CR>", desc = "lspsaga code action" },

      -- Peek definition
      -- You can edit the file containing the definition in the floating window
      -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
      -- It also supports tagstack
      -- Use <C-t> to jump back
      { "gp", "<cmd>Lspsaga peek_definition<CR>", desc = "lspsaga peek definition" },

      -- Floating terminal
      { "<A-d>", "<cmd>Lspsaga term_toggle<CR>", desc = "lspsaga term toggle" },
      -- { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "lspsaga hover doc" },
    },
  },
  {
    "SmiteshP/nvm-navic",
    enabled = false,
  },

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = true,
  },
}
