local M = {}

function M.plugin_install(need_sync)
  return function(use)
    use { 'lewis6991/impatient.nvim' }
    use { 'wbthomason/packer.nvim' }
    use { 'nvim-tree/nvim-web-devicons' }
    use {
      'folke/tokyonight.nvim',
      config = function ()
        require('plugins.tokyonight').setup()
      end
    }
    use { 'folke/neodev.nvim' }
    use {
      "kylechui/nvim-surround",
      tag = "*",
      config = function()
        require("nvim-surround").setup({})
      end,
    }

    use {
      'goolord/alpha-nvim',
      config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
      end
    }

    use {
      "williamboman/mason.nvim",
      config = function()
        require('mason').setup()
      end,
    }

    use {
      'lewis6991/gitsigns.nvim',
      tag = 'v0.5',
      config = function ()
        require('plugins.gitsigns').setup()
      end
    }

    use {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup({})
      end
    }

    use {
      'lukas-reineke/indent-blankline.nvim',
        require('plugins.indentlines').setup()
    }

    use {
      "SmiteshP/nvim-navic",
      config = function ()
        require('plugins.nvimnavic').setup()
      end,
      requires = "neovim/nvim-lspconfig",
    }

    -- Lua
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup {
        }
      end
    }

    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup({
        })
      end
    }

    use {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require('mason-lspconfig').setup({
          ensure_installed = {
            'sumneko_lua',
            'rust_analyzer',
            'clangd'
          },
        })
      end,
    }

    use({
      "folke/persistence.nvim",
      event = "BufReadPre", -- this will only start session saving when an actual file was opened
      module = "persistence",
      config = function()
        require('plugins.persistence').setup()
      end,
    })

    use {
      'neovim/nvim-lspconfig',
      opt = true,
      ft = { 'lua', 'c', 'cpp' },
      setup = function ()
        require('core.lazy_load').on_file_open 'nvim-lspconfig'
      end,
      config = function()
        require('lsp')
      end,
    }

    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons'
      },
      config = function()
        require('plugins.nvimtree').setup()
      end,
    }

    use { 'nvim-treesitter/nvim-treesitter-textobjects' }

    use {
      'nvim-treesitter/nvim-treesitter',
      config = function()
        require('plugins.treesitter').setup()
      end,
      run = ":TSUpdate",
    }

    use {
      'hrsh7th/cmp-nvim-lsp',
      after = 'cmp-nvim-lua'
    }

    use {
      'hrsh7th/cmp-buffer',
      after = 'cmp-nvim-lsp'
    }
    use {
      'hrsh7th/cmp-path',
      after = 'cmp-buffer',
    }
    use {
      'hrsh7th/cmp-nvim-lua',
      after = 'cmp_luasnip',
    }
    use {
      'saadparwaiz1/cmp_luasnip',
      after = 'LuaSnip',
    }

    use {
      'rafamadriz/friendly-snippets',
      event = "InsertEnter",
    }

    use {
      'L3MON4D3/LuaSnip',
      after = 'nvim-cmp',
      config = function ()
        require('plugins.luasnippet').setup()
      end
    }

    use {
      'hrsh7th/nvim-cmp',
      after = 'friendly-snippets',
      config = function()
        require('plugins.cmp').setup()
      end
    }


    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        require('plugins.lualine').setup()
      end,
    }

    use {
      'numToStr/Comment.nvim',
      config = function()
          require('plugins.comment').setup()
      end
    }

    use {
      'akinsho/bufferline.nvim',
      tag = "v3.*",
      requires = 'nvim-tree/nvim-web-devicons',
      config = function()
        require('plugins.bufferline').setup()
      end,
    }

    use { "nvim-telescope/telescope-project.nvim" }

    use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      requires = {'nvim-lua/plenary.nvim'},
      config = function ()
        require('plugins.telescope').setup()
      end
    }

    if need_sync then
     require('packer').sync()
    end
  end
end

M.packer_config = {
  display = {
    open_fn = require('packer.util').float,
  },
  profile = {
    enable = true,
    threshold = 1,
  }
}

function M.setup(need_sync)
  require('packer').startup({
    M.plugin_install(need_sync),
    config = M.packer_config,
  })
end

return M

