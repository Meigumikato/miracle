return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
      { "kevinhwang91/promise-async" },
    },
    enabled = false,
    opts = {
      --   preview = {
      --     mappings = {
      --       scrollB = "<C-b>",
      --       scrollF = "<C-f>",
      --       scrollU = "<C-u>",
      --       scrollD = "<C-d>",
      --     },
      --   },

      -- provider_selector = function(bufnr, filetype, buftype)
      --   return { "treesitter", "indent" }
      -- end,
      open_fold_hl_timeout = 150,
      close_fold_kinds = { "imports", "comment" },
      preview = {
        win_config = {
          border = { "", "─", "", "", "", "─", "", "" },
          winhighlight = "Normal:Folded",
          winblend = 0,
        },
        mappings = {
          scrollU = "<C-u>",
          scrollD = "<C-d>",
          jumpTop = "[",
          jumpBot = "]",
        },
      },
      provider_selector = function(_, filetype, buftype)
        return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
          or { "treesitter", "indent" } -- if file opened, try to use treesitter if available
      end,
    },
  },
}
