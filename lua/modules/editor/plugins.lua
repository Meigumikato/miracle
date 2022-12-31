local M = {
  ['nvim-treesitter/nvim-treesitter'] = {
    cmd = require('core.lazy_load').treesitter_cmds,
    event = "BufReadPost",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "p00f/nvim-ts-rainbow",
    },
    build = ":TSUpdate",
    config = require('modules.editor.config.treesitter'),
  },

  ["kylechui/nvim-surround"] = {
    event = { 'BufReadPost' },
    config = function()
      require("nvim-surround").setup()
    end,
  },

  ["windwp/nvim-autopairs"] = {
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt" , "guihua",
          "guihua_rust", "clap_input" },
      })
    end
  },

  ['numToStr/Comment.nvim'] = {
    event = { 'BufReadPost' },
    config = function()
      require('Comment').setup()
    end
  },
  ["lukas-reineke/indent-blankline.nvim"] = {
    event = { 'BufReadPost' },
    config = require('modules.editor.config.indentline'),
  }
}


return M
