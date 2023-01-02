local M = {
  ['nvim-treesitter/nvim-treesitter'] = {
    cmd = require('core.lazy_load').treesitter_cmds,
    ft = { 'c', 'cpp', 'lua', 'go', 'rust' },
    dependencies = {
      "p00f/nvim-ts-rainbow",
      "nvim-treesitter/nvim-treesitter-textobjects",
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
  },
  ["ggandor/leap.nvim"] = {
    event = "BufReadPost",
    dependencies = {
      { "ggandor/flit.nvim", config = { labeled_modes = "nv" } },
    },
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  ["RRethy/vim-illuminate"] = {
    event = "BufReadPost",
    config = function()
      require("illuminate").configure({ delay = 200 })
    end,
    keys = {
      {
        "]]",
        function()
          require("illuminate").goto_next_reference(false)
        end,
        desc = "Next Reference",
      },
      {
        "[[",
        function()
          require("illuminate").goto_prev_reference(false)
        end,
        desc = "Prev Reference",
      },
    },
  },
}

return M
