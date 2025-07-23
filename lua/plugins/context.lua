return {
  -- lazy.nvim
  -- {
  --   "m4xshen/hardtime.nvim",
  --   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  --   opts = {},
  -- },
  -- { "mistricky/codesnap.nvim", build = "make" },

  -- lazy.nvim:
  --
  -- For `plugins/markview.lua` users.
  { "mason-org/mason.nvim", version = "^1.0.0" },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- For blink.cmp's completion
    -- source
    -- dependencies = {
    --     "saghen/blink.cmp"
    -- },
  },
  {
    "A7lavinraj/assistant.nvim",
    dependencies = { "stevearc/dressing.nvim" }, -- optional but recommended
    keys = {
      { "<leader>ma", "<cmd>AssistantToggle<cr>", desc = "Toggle Assistant.nvim window" },
    },
    opts = {},
  },

  {
    "nvzone/typr",
    cmd = "TyprStats",
    dependencies = "nvzone/volt",
    opts = {},
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      scroll = { enabled = false },
      image = { enabled = true },
      statuscolumn = { enabled = true },
    },
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "tris203/precognition.nvim",
    cmd = "Precognition",
    opts = {
      -- startVisible = true,
      -- showBlankVirtLine = true,
      -- highlightColor = { link = "Comment" },
      -- hints = {
      --      Caret = { text = "^", prio = 2 },
      --      Dollar = { text = "$", prio = 1 },
      --      MatchingPair = { text = "%", prio = 5 },
      --      Zero = { text = "0", prio = 1 },
      --      w = { text = "w", prio = 10 },
      --      b = { text = "b", prio = 9 },
      --      e = { text = "e", prio = 8 },
      --      W = { text = "W", prio = 7 },
      --      B = { text = "B", prio = 6 },
      --      E = { text = "E", prio = 5 },
      -- },
      -- gutterHints = {
      --     G = { text = "G", prio = 10 },
      --     gg = { text = "gg", prio = 9 },
      --     PrevParagraph = { text = "{", prio = 8 },
      --     NextParagraph = { text = "}", prio = 8 },
      -- },
      -- disabled_fts = {
      --     "startify",
      -- },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          { "<leader>z", group = "LeetCode" },
        },
      },
    },
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    cmd = "Leet",
    keys = {
      {
        mode = { "n" },
        "<leader>mt",
        "<cmd>Leet test<cr>",
        desc = "Test LeetCode",
      },
      {
        mode = { "n" },
        "<leader>ml",
        "<cmd>Leet list<cr>",
        desc = "Open LeetCode List",
      },
      {
        mode = { "n" },
        "<leader>mdd",
        "<cmd>Leet desc<cr>",
        desc = "open LeetCode Descriptions",
      },
      {
        mode = { "n" },
        "<leader>mds",
        "<cmd>Leet desc stats<cr>",
        desc = "open LeetCode Descriptions stats",
      },
      {
        mode = { "n" },
        "<leader>ms",
        "<cmd>Leet submit<cr>",
        desc = "Submit LeetCode",
      },
      {
        mode = { "n" },
        "<leader>mm",
        "<cmd>Leet menu<cr>",
        desc = "Open LeetCode Menu ",
      },
      {
        mode = { "n" },
        "<leader>mi",
        "<cmd>Leet info<cr>",
        desc = "Open LeetCode Info ",
      },
      {
        mode = { "n" },
        "<leader>mb",
        "<cmd>Leet tabs<cr>",
        desc = "Open LeetCode Tabs ",
      },
      {
        mode = { "n" },
        "<leader>mo",
        "<cmd>Leet<cr>",
        desc = "Open LeetCode Menu ",
      },
      {
        mode = { "n" },
        "<leader>mc",
        "<cmd>Leet console<cr>",
        desc = "Open LeetCode Console ",
      },
    },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      storage = {
        home = "~/Projects/algorithm/problems",
      },
      injector = {
        ["cpp"] = {
          before = { [[#include <bits/stdc++.h>]], [[using namespace std;]] },
          after = "int main(int argc, char** argv) {\n return 0;\n }",
        },
      },
      description = {
        position = "left",
        width = "40%",
        show_stats = false,
      },
      plugins = {
        non_standalone = true,
      },
      -- configuration goes here
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    lazy = true,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      table.remove(opts.sections.lualine_c, #opts.sections.lualine_c)
      -- vim.notify(string(#opts.sections.lualine_c))
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      -- local actions = require("telescope.actions")
      local open_with_trouble = require("trouble.sources.telescope").open

      -- Use this to add more results without clearing the trouble list
      -- local add_to_trouble = require("trouble.sources.telescope").add

      opts.defaults = {
        mappings = {
          i = {
            ["<C-t>"] = open_with_trouble,
            -- ["<M-a>"] = add_to_trouble,
          },
          n = {
            ["<C-t>"] = open_with_trouble,
            -- ["<M-a>"] = add_to_trouble,
          },
        },
      }
    end,
  },
  { "shortcuts/no-neck-pain.nvim", event = "VeryLazy", version = "*" },
  {
    "mrjones2014/smart-splits.nvim",
    event = "VeryLazy",
    keys = {
      --       <A-h>', require('smart-splits').resize_left)
      -- vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
      -- vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
      -- vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
      {
        "<C-h>",
        function()
          require("smart-splits").move_cursor_left()
        end,
        desc = "",
      },
      {
        "<C-j>",
        function()
          require("smart-splits").move_cursor_down()
        end,
        desc = "",
      },
      {
        "<C-k>",
        function()
          require("smart-splits").move_cursor_up()
        end,
        desc = "",
      },
      {
        "<C-l>",
        function()
          require("smart-splits").move_cursor_right()
        end,
        desc = "",
      },
      {
        "<C-\\>",
        function()
          require("smart-splits").move_cursor_previous()
        end,
        desc = "",
      },
      -- swapping buffers between windows
      -- vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
      -- vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
      -- vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
      -- vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
    },
  },
}
