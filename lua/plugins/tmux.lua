return {
  -- {
  --   "christoomey/vim-tmux-navigator",
  --   keys = {
  --
  --     { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Go to the previous pane" },
  --
  --     { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Got to the left pane" },
  --
  --     { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Got to the down pane" },
  --
  --     { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Got to the up pane" },
  --
  --     { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Got to the right pane" },
  --   },
  -- },

  {
    "aserowy/tmux.nvim",
    opts = {
      -- navigation = {
      --   enable_default_keybindings = false,
      -- },
    },
    keys = {
      {
        "<C-h>",
        function()
          require("tmux").move_left()
        end,
        desc = "navigate to left",
      },
      {
        "<C-j>",
        function()
          require("tmux").move_bottom()
        end,
        desc = "navigate to bottom",
      },
      {
        "<C-k>",
        function()
          require("tmux").move_top()
        end,
        desc = "navigate to top",
      },
      {
        "<C-l>",
        function()
          require("tmux").move_right()
        end,
        desc = "navigate to right",
      },
    },
  },
}
