local M = {
  ['neovim/nvim-lspconfig'] = {
    ft = { 'lua', 'c', 'cpp', 'rust' },
    config = require('modules.completion.config.lsp'),
  },

  ["glepnir/lspsaga.nvim"] = {
    branch = "main",
    config = require('modules.completion.config.saga'),
  },
  ['rafamadriz/friendly-snippets'] = {
    event = "InsertEnter",
  },

  ['L3MON4D3/LuaSnip'] = {
    lazy = true,
    config = require('modules.completion.config.luasnip'),
  },

  ['hrsh7th/nvim-cmp'] = {
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      'hrsh7th/cmp-nvim-lua',
      "hrsh7th/cmp-emoji",
      { "hrsh7th/cmp-cmdline", enabled = false },
      { "dmitmel/cmp-cmdline-history", enabled = false },
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
    },
    config = require('modules.completion.config.cmp'),
  },
}

return M
