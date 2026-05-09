return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>fo", group = "oil" },
      },
    },
  },
  {
    "stevearc/oil.nvim",
    opts = function(_, opts)
      local detail = false
      opts.delete_to_trash = true
      opts.view_options = { show_hidden = true }
      opts.keymaps = {
        ["q"] = { "actions.close", desc = "Close oil" },
        ["<C-h>"] = false,
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            detail = not detail
            if detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
      }
    end,
    keys = {
      {
        "<leader>fo",
        function()
          require("oil").open_float()
        end,
        desc = "Open Oil (float)",
      },
      {
        "-",
        function()
          require("oil").open()
        end,
        desc = "Open parent directory",
      },
    },
  },
}
