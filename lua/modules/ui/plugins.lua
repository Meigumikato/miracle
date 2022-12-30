local M = {

  ['glepnir/dashboard-nvim'] = {},

  ['folke/tokyonight.nvim'] = {
    config = function ()
      require('plugins.tokyonight').setup()
    end
  },

  ['nvim-tree/nvim-tree.lua'] = {
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('plugins.nvimtree')
    end,
  },

  ['akinsho/bufferline.nvim'] = {
    -- lazy = true,
    event = { "BufAdd" },
    tag = "v3.1.0",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup {
        options = {
          always_show_bufferline = false,
        },
      }
      -- require('plugins.bufferline').setup()
    end,
  },
}


return M
