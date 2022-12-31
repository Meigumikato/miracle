local M = {
  ["p00f/clangd_extensions.nvim"] = {
    ft = { 'cpp', 'c' },
    config = function ()
      require('modules.lang.config.clangd')
    end,
    dependencies = {
      'ray-x/navigator.lua',
    },
  },
  ['simrat39/rust-tools.nvim'] = {
    ft = { 'rust' },
    config = function()
      require('modules.lang.config.rust_analyzer')
    end,
    dependencies = {
      'ray-x/navigator.lua',
    },
  }
}

return M
