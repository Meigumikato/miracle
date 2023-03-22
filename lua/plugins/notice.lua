return {
  "folke/noice.nvim",
  opts = {
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          kind = "search_count",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "notify",
          min_height = 15,
        },
        view = "split",
      },
    },
  },
}
