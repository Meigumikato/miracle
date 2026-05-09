return {
  {
    "dmtrKovalenko/fff.nvim",
    build = function()
      require("fff.download").download_or_build_binary()
    end,
    opts = {},
    lazy = false,
    keys = {
      {
        "ff",
        function()
          require("fff").find_files()
        end,
        desc = "Find files",
      },
      {
        "fg",
        function()
          require("fff").live_grep()
        end,
        desc = "Live grep",
      },
      {
        "fz",
        function()
          require("fff").live_grep({
            grep = { modes = { "fuzzy", "plain" } },
          })
        end,
        desc = "Fuzzy grep",
      },
      {
        "fc",
        function()
          require("fff").live_grep({ query = vim.fn.expand("<cword>") })
        end,
        desc = "Search current word",
      },
    },
  },
}
