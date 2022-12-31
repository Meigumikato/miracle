local M = {
  ['nvim-telescope/telescope.nvim'] = {
    tag = '0.1.0',
    cmd = { "Telescope" },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-project.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
      },
    },
    config = require('modules.tools.config.telescope')
  },

  ["folke/which-key.nvim"] = {
    event = "VeryLazy",
    dependencies = {
      'mrjones2014/legendary.nvim'
    },
    config = require("modules.tools.config.whichkey"),
  },
  ['mrjones2014/legendary.nvim'] = {
    event = "VeryLazy",
    config = require("modules.tools.config.legendary"),
  },

  ["williamboman/mason-lspconfig.nvim"] = {
    cmd = { 'LspInstall', 'LspUnistall' },
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = {
          'sumneko_lua',
          'rust_analyzer',
          'clangd'
        },
      }
    end,
  },

  ["williamboman/mason.nvim"] = {
    cmd = require('core.lazy_load').mason_cmds,
    config = function()
      require('mason').setup()
    end,
  },

  ['rcarriga/nvim-notify'] = {
    config = function ()
      vim.notify = require("notify")
    end
  },
  ['jose-elias-alvarez/null-ls.nvim'] = {
    lazy = true,
  }
}

return M
