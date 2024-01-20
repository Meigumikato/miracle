return {
  {
    "SmiteshP/nvim-navic",
    opts = function(_, opts)
      opts.depth_limit = 8
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local navic = require("nvim-navic")
      opts.sections.lualine_c = vim.list_slice(opts.sections.lualine_c, 1, 4)
      opts.winbar = {
        lualine_c = {
          {
            function()
              return navic.get_location()
            end,
            cond = function()
              return navic.is_available()
            end,
          },
        },
      }
    end,
  },
}
