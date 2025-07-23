-- vim.g.mapleader = " "
-- vim.g.maplocalleader = ","

return {
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   build = ":TSUpdate",
  --   opts = {
  --     ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "norg" },
  --     highlight = { enable = true },
  --   },
  --   config = function(_, opts)
  --     require("nvim-treesitter.configs").setup(opts)
  --   end,
  -- },
  {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.keybinds"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/Notes",
              },
              default_workspace = "notes",
            },
          },
        },
      })

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
  },
}
