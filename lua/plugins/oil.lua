return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          { "<leader>fm", group = "oil" },
        },
      },
    },
  },
  {
    "stevearc/oil.nvim",
    opts = function(_, opts)
      local detail = false
      opts.delete_to_trash = true
      opts.keymaps = {
        ["q"] = { "actions.close", desc = "Close oil and restore original buffer" },
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
        "<leader>fmo",
        function()
          require("oil").open_float()
        end,
        desc = "Open Oil file manager",
      },
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
  },
}
