local M = {

  ['glepnir/dashboard-nvim'] = {
    config = require('modules.ui.config.dashboard'),
  },

  ['folke/tokyonight.nvim'] = {
    priority = 1000,
    config = require('modules.ui.config.tokyonight'),
  },

  ['nvim-tree/nvim-tree.lua'] = {
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = require('modules.ui.config.nvimtree'),
  },

  ['akinsho/bufferline.nvim'] = {
    event = { "BufAdd" },
    tag = "v3.1.0",
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = require('modules.ui.config.bufferline'),
  },
  ["folke/todo-comments.nvim"] = {
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = require('modules.ui.config.todocomment'),
  },

  ['nvim-lualine/lualine.nvim'] = {
    event = { "BufReadPost" },
    -- dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = require('modules.ui.config.lualine')
  },
}


return M
