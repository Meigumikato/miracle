local M = {

  -- load on specify filetype
  ['neovim/nvim-lspconfig'] = {
    lazy = true,
    ft = { 'lua' },
    config = require('modules.completion.config.lsp'),
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      { "folke/neodev.nvim", config = true },
    },
  },

  ['ray-x/lsp_signature.nvim'] = {
    lazy = true
  },
  -- load on lsp attach
  ["glepnir/lspsaga.nvim"] = {
    event = "LspAttach",
    branch = "main",
    config = require('modules.completion.config.saga'),
  },
  -- ['ray-x/navigator.lua'] = {
  --   ft = { 'lua', 'sh' },
  --   -- lazy = true,
  --   dependencies = {
  --     { 'ray-x/guihua.lua', build = 'cd lua/fzy && make' },
  --     { 'neovim/nvim-lspconfig' },
  --     { 'ray-x/lsp_signature.nvim' },
  --   },
  --   config = function()
  --     require('modules.completion.config.navigator')
  --   end,
  -- },

  -- load by cmp loaded
  ['L3MON4D3/LuaSnip'] = {
    lazy = true,
    config = require('modules.completion.config.luasnip'),
    dependencies = {
      'rafamadriz/friendly-snippets'
    },
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
