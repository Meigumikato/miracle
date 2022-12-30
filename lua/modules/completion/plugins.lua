local M = {

  ['neovim/nvim-lspconfig'] = {
    ft = { 'lua', 'c', 'cpp' },
    config = function()
      require('lsp')
    end,
  },
}

return M
