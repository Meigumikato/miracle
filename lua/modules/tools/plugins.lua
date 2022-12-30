local M = {
  ['nvim-treesitter/nvim-treesitter'] = {
    cmd = require('core.lazy_load').treesitter_cmds,
    event = "BufReadPost",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = require('modules.tools.config.treesitter')
  },

  ["kylechui/nvim-surround"] = {
    event = { 'BufReadPost' },
    config = function()
      require("nvim-surround").setup()
    end,
  },

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
    keys = { '<leader>', '"', "'", "`" },
    config = require("modules.tools.config").whichkey,
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
}

return M
