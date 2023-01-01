local M = {

  ["p00f/clangd_extensions.nvim"] = {
    ft = { 'cpp', 'c' },
    config = function()
      require('modules.lang.config.clangd')
    end,
    dependencies = {
      'neovim/nvim-lspconfig'
    },
  },
  ['simrat39/rust-tools.nvim'] = {
    ft = { 'rust' },
    config = function()
      require('modules.lang.config.rust_analyzer')
    end,
    dependencies = {
      'neovim/nvim-lspconfig'
    },
  },
  ['ray-x/go.nvim'] = {
    ft = { 'go' },
    config = function()
      require('modules.lang.config.gopls')
    end,
    dependencies = {
      'neovim/nvim-lspconfig'
    },
  }
}

return M
