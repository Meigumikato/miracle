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

  ['kevinhwang91/nvim-bqf'] = {
    ft = 'qf',
    dependencies = {
      'nvim-treesitter/nvim-treesitter'
    }
  },


  ['jose-elias-alvarez/null-ls.nvim'] = {
    event = { 'LspAttach' },
    config = function()
      local nuls_ls = require('null-ls')
      nuls_ls.setup {
        debug = false,
        sources = {
          -- nuls_ls.builtins.formatting.clang_format,
          nuls_ls.builtins.formatting.stylua,
          nuls_ls.builtins.formatting.gofumpt
        },
      }
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  ["folke/trouble.nvim"] = {
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      }
    end
  },

  ['lewis6991/gitsigns.nvim'] = {
    event = "BufReadPost",
    config = function()
      require('modules.tools.config.gitsign')
    end
  },

  ['sindrets/diffview.nvim'] = {
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory',
      'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewRefresh' },
    config = function()
      require("diffview").setup {}
    end,
    dependencies = { 'nvim-lua/plenary.nvim' }
  }
}

return M
