return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "norg", "org" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
    ---@module "render-markdown"
    ---@type render.md.UserConfig
    opts = {
      heading = {
        icons = { "󰉔 ", "󰉗 ", "󰉚 ", "󰉝 ", "󰉡 ", "󰉣 " },
      },
      code = { sign = false, width = "block", right_pad = 1 },
      checkbox = {
        unchecked = { icon = "󰄱 " },
        checked = { icon = "󰄲 " },
      },
    },
  },
}
