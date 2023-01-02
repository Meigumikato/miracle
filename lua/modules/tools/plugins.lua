local M = {
  ['nvim-telescope/telescope.nvim'] = {
    tag = '0.1.0',
    cmd = { "Telescope" },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-project.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'alex-laycalvert/telescope-dotfiles.nvim',
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
    event = {'LspAttach'},
    dependencies = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
      }
    end
  },

  ['lewis6991/gitsigns.nvim'] = {
    -- event = "BufReadPost",
    lazy = true,
    config = function()
      require('modules.tools.config.gitsign')
    end
  },

  ['sindrets/diffview.nvim'] = {
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory',
            'DiffviewToggleFiles', 'DiffviewFocusFiles', 'DiffviewRefresh' },
    config = function()
      require("diffview").setup {
        -- hooks = {
        --   view_opened = function()
        --     vim.notify('hideline', vim.log.levels.INFO)
        --     require('lualine').hide {
        --       unhide = false,
        --     }
        --   end,
        --   view_closed = function()
        --     vim.notify('restoreline', vim.log.levels.INFO)
        --     require('lualine').hide {
        --       unhide = true,
        --     }
        --   end
        -- }
      }
    end,
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  ["TimUntersberger/neogit"] = {
    cmd = {"Neogit"},
    config = {
      integrations = { diffview = true },
      use_magit_keybindings = true,
      signs = {
        -- { CLOSED, OPENED }
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
      },
    },
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
    },

    dependencies = {
      'sindrets/diffview.nvim',
    }
  },


}

return M
