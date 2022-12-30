local M = {}


M.lspconfig = {
  plugin = true,
  n = {
    ['gd'] = {
      function()
        vim.lsp.buf.definition()
      end,
      'lsp goto definition',
    },
    ['K'] = {
      function()
        vim.lsp.buf.hover()
      end,
      'lsp hover'
    },
    ['[d'] = {
      function()
        vim.diagnostic.goto_prev({})
      end,
      'lsp diagnostic goto prev'
    },
    [']d'] = {
      function()
        vim.diagnostic.goto_next()
      end,
      'lsp diagnostic goto next'
    },
    ['<space>fm'] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      'lsp format'
    },
    ['<space>f'] = {
      function()
        vim.diagnostic.open_float()
      end,
      'lsp diagnostic open float'
    }
  }
}

return M
