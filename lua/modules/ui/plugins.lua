local M = {

  ['glepnir/dashboard-nvim'] = {
    event = "BufWinEnter",
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
    event = { "BufNewFile", "BufReadPost" },
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('modules.ui.config.lualine')
    end,
  },

  ['folke/lsp-colors.nvim'] = {
    event = 'LspAttach',
    config = function()
      require("lsp-colors").setup({
        Error = "#db4b4b",
        Warning = "#e0af68",
        Information = "#0db9d7",
        Hint = "#10B981"
      })
    end
  },

  ['j-hui/fidget.nvim'] = {
    event = 'LspAttach',
    config = function()
      require('fidget').setup()
    end
  },

  ['simrat39/symbols-outline.nvim'] = {
    cmd = { 'SymbolsOutline' },
    config = function()
      require("symbols-outline").setup()
    end
  },

  ['rcarriga/nvim-notify'] = {
    config = function()
      vim.notify = require("notify")
    end
  },
  -- ["stevearc/dressing.nvim"] = {
  --   config = require('modules.ui.config.dressing'),
  -- },
  -- Packer
  -- ["folke/noice.nvim"] = {
  --   config = function()
  --     vim.notify = require("notify")
  --     require('modules.ui.config.noice')
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   }
  -- }
  --

  -- ["utilyre/barbecue.nvim"] = {
  --   -- event = 'LspAttach',
  --   branch = "dev", -- omit this if you only want stable updates
  --   dependencies = {
  --     "neovim/nvim-lspconfig",
  --     "smiteshp/nvim-navic",
  --     "kyazdani42/nvim-web-devicons", -- optional dependency
  --   },
  --   config = function ()
  --     require("barbecue").setup {
  --       -- attach_navic = true,
  --       -- create_autocmd = false,
  --       -- exclude_filetypes = { "toggleterm", "dashboard", "quickfix", "nvimtree" },
  --     }
  --   end
  -- }
}


return M
