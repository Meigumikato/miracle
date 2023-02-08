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
    dependencies = { { "nvim-tree/nvim-web-devicons" } }
  },
  {
    "SmiteshP/nvm-navic",
    enabled = false,
  },
}
