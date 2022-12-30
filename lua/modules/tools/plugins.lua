local M = {

  ["kylechui/nvim-surround"] = {
    event = { 'BufReadPost' },
    config = function()
      require("nvim-surround").setup()
    end,
  },

  ["nvim-telescope/telescope-project.nvim" ] = {
    lazy = true,
    config = function()
    end,
  },

  ['nvim-telescope/telescope-fzf-native.nvim'] = {
    lazy = true,
    build = 'make',
    configa = function()
    end
  },

  ["nvim-telescope/telescope-file-browser.nvim"] = {
    lazy = true,
    config = function()
    end
  },


  ['nvim-telescope/telescope.nvim'] = {
    tag = '0.1.0',
    -- module = "telescope",
    cmd = { "Telescope" },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugins.telescope')
    end,
    -- after = {
    --   'telescope-fzf-native.nvim',
      -- 'telescope-file-browser.nvim',
    -- }
  },

  ["folke/which-key.nvim"] = {
    keys = { '<leader>', '"', "'", "`" },
    config = function()
      require("plugins.whichkey")
    end,
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
