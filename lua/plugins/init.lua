local M = {}

-- local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- local cache_path = vim.fn.stdpath('cache')


M.plugin_list = {

  -- ['wbthomason/packer.nvim'] = {
  --   opt = true
    -- cmd = require('core.lazy_load').packer_cmds,
    -- config = function ()
    --   require('plugins').load_config()
    -- end
  -- },
  -- ['lewis6991/impatient.nvim'] = { },
  -- ['folke/neodev.nvim']  = {},

  ['folke/tokyonight.nvim'] = {
    config = function ()
      require('plugins.tokyonight').setup()
    end
  },

  ["kylechui/nvim-surround"] = {
    event = { 'BufReadPost' },
    config = function()
      require("nvim-surround").setup()
    end,
  },

  --  ['goolord/alpha-nvim'] = {
  --    config = function ()
  --      require'alpha'.setup(require'alpha.themes.startify'.config)
  --    end
  --  },

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

   -- ['lewis6991/gitsigns.nvim'] = {
   --   ft = 'gitcommit',
   --   tag = 'v0.5',
   --   setup = function ()
   --    require('core.lazy_load').gitsigns()
   --   end,
   --   config = function ()
   --     require('plugins.gitsigns').setup()
   --   end
   -- },

   -- ["windwp/nvim-autopairs"] = {
   --   config = function()
   --     require("nvim-autopairs").setup({})
   --   end
   -- },

   -- ['lukas-reineke/indent-blankline.nvim'] = {
   --   opt = true,
   --   setup = function ()
   --    require('core.lazy_load').on_file_open 'indent-blankline.nvim'
   --   end,
   --   config = function ()
   --    require('plugins.indentlines').setup()
   --   end
   -- },


   -- ["folke/todo-comments.nvim"] = {
   --   requires = "nvim-lua/plenary.nvim",
   --   config = function()
   --     require("todo-comments").setup {
   --     }
   --   end
   -- },

   ["folke/which-key.nvim"] = {
     -- module = 'which-key',
     keys = { '<leader>', '"', "'", "`" },
     config = function()
       require("plugins.whichkey")
     end,
   },

   -- ['mrjones2014/legendary.nvim'] = {
   --  tag = 'v2.1.0',
   --  config = function ()
   --    require("plugins.legendary")
   --  end
   -- },


  --  -- ["folke/persistence.nvim"] = {
  --  --   event = "BufReadPre", -- this will only start session saving when an actual file was opened
  --  --   module = "persistence",
  --  --   config = function()
  --  --     require('plugins.persistence').setup()
  --  --   end,
  --  -- },

   ['neovim/nvim-lspconfig'] = {
     ft = { 'lua', 'c', 'cpp' },
     -- setup = function ()
     --   require('core.lazy_load').on_file_open 'nvim-lspconfig'
     -- end,
     config = function()
       require('lsp')
     end,
   },

   -- ['nvim-tree/nvim-tree.lua'] = {
   --   cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
   --   dependencies = { 'nvim-tree/nvim-web-devicons' },
   --   config = function()
   --     require('plugins.nvimtree')
   --   end,
   -- },


   -- ['nvim-treesitter/nvim-treesitter'] = {
   --   module = 'nvim-treesitter',
   --   setup = function ()
   --     require('core.lazy_load').on_file_open 'nvim-treesitter'
   --   end,
   --   cmd = require('core.lazy_load').treesitter_cmds,
   --   run = ":TSUpdate",
   --   config = function()
   --     require('plugins.treesitter').setup()
   --   end,
   -- },
   -- ['nvim-treesitter/nvim-treesitter-textobjects'] = {
   --    after = "nvim-treesitter"
   -- },

  --  ['hrsh7th/cmp-nvim-lsp'] = {
  --    after = 'cmp-nvim-lua'
  --  },

  --  ['hrsh7th/cmp-buffer'] = {
  --    after = 'cmp-nvim-lsp'
  --  },
  --  ['hrsh7th/cmp-path'] = {
  --    after = 'cmp-buffer',
  --  },
  --  ['hrsh7th/cmp-nvim-lua'] = {
  --    after = 'cmp_luasnip',
  --  },
  --  ['saadparwaiz1/cmp_luasnip'] = {
  --    after = 'LuaSnip',
  --  },

  --  ['rafamadriz/friendly-snippets'] = {
  --    event = "InsertEnter",
  --  },

  --  ['L3MON4D3/LuaSnip'] = {
  --    after = 'nvim-cmp',
  --    config = function ()
  --      require('plugins.luasnippet').setup()
  --    end
  --  },

  --  ['hrsh7th/nvim-cmp'] = {
  --    after = 'friendly-snippets',
  --    config = function()
  --      require('plugins.cmp').setup()
  --    end
  --  },


   -- ['nvim-lualine/lualine.nvim'] = {
   --   bufread = true,
   --   requires = { 'kyazdani42/nvim-web-devicons', opt = true },
   --   config = function()
   --     require('plugins.lualine').setup()
   --   end,
   -- },

  --  ['numToStr/Comment.nvim'] = {
  --    module = 'Comment',
  --    keys = { 'gc', 'gb' },
  --    config = function()
  --        require('plugins.comment').setup()
  --    end
  --  },


  -- ["nvim-telescope/telescope-project.nvim" ] = {
  --   lazy = true,
  -- },

  -- ['nvim-telescope/telescope-fzf-native.nvim'] = {
  --   -- module = "telescope",
  --   lazy = true,
  --   build = 'make',
  -- },

  -- ["nvim-telescope/telescope-file-browser.nvim"] = {
  --   -- module = "telescope",
  --   -- opt = true,
  --   lazy = true,
  --   -- after = {
  --   --   'telescope-fzf-native.nvim',
  --   -- }
  -- },


  -- ['nvim-telescope/telescope.nvim'] = {
  --   tag = '0.1.0',
  --   -- module = "telescope",
  --   cmd = { "Telescope" },
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  --   config = function ()
  --     require('plugins.telescope')
  --   end,
  --   -- after = {
  --   --   'telescope-fzf-native.nvim',
  --     -- 'telescope-file-browser.nvim',
  --   -- }
  -- },

  -- ['glepnir/dashboard-nvim'] = {},
}

-- M.packer_config = {
--   -- compile_path = "",
--   auto_clean = true,
--   compile_on_sync = true,
--   git = { clone_timeout = 6000 },
--   display = {
--     working_sym = "ﲊ",
--     error_sym = "✗ ",
--     done_sym = " ",
--     removed_sym = " ",
--     moved_sym = "",
--     open_fn = function()
--       return require("packer.util").float { border = "rounded" }
--     end,
--   },
--   -- log = { level = 'info' },
--   profile = {
--     enable = true,
--     threshold = 1,
--   }
-- }



local function load_lazy ()
  -- local is_first_installed = false

  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "--single-branch",
      "https://github.com/folke/lazy.nvim.git",
      lazypath,
    })
  end
  vim.opt.runtimepath:prepend(lazypath)
  -- load packer
  -- if not vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  --   vim.pretty_print("First Install, Now Cloning Packer ...")
  --   vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
  --   is_first_installed = true
  -- end

  -- vim.api.nvim_command("packadd packer.nvim")
  -- return is_first_installed
end

local function convert_plugin_list()
  local res = {}
  for key, config in pairs(M.plugin_list) do
    config[1] = key
    res[#res + 1] = config
  end


  return res
end



-- local function packer_startup_func (use)
--   for plugin, config in pairs(M.plugin_list) do
--     config[1] = plugin
--     use(config)
--   end
-- end

function M:load_config()
  load_lazy()


  local startup_plugin_list = convert_plugin_list()

  require('lazy').setup(startup_plugin_list)


  -- if is_packer_first_installed == true then
    -- vim.pretty_print("is_first_installed packer sync")
    -- packer.sync() -- sync and compile
  -- end


  -- vim.api.nvim_create_user_command("PackerSync",
  --   function ()
  --     load_packer()
  --     require('packer').sync()
  --   end,
  --   {}
  -- )

  -- packer.compile()
end

return M
