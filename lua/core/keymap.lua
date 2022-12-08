local M = {}

M.basic = {
  n = {
    ['<C-h>'] = { '<C-w>h', "switch to left" , opts = { noremap = true, silent = true } },
    ['<C-l>'] = { '<C-w>l', "switch to right", opts = { noremap = true, silent = true } },
    ['<C-j>'] = { '<C-w>j', "switch to down" , opts = { noremap = true, silent = true } },
    ['<C-k>'] = { '<C-w>k', "switch to up"   , opts = { noremap = true, silent = true } },
    ['<space>x'] = {
      '<CMD> bd <CR>',
      'close buffer',
      opts = { noremap = true, silent = true }
    },
  }
}

M.nvimtree = {
  n = {
    ['<space>e'] = {
      '<CMD> NvimTreeToggle <CR>',
      'nvim tree toggle',
      opts = { noremap = true, silent = true }
    },
  }
}

M.bufferline = {
  n = {
    ['<TAB>'] = {
      '<CMD> BufferLineCycleNext <CR>',
      'switch to next buffer',
      opts = { noremap = true, silent = true }
    },
    ['<S-TAB>'] = {
      '<CMD> BufferLineCyclePrev <CR>',
      'switch to prev buffer',
      opts = { noremap = true, silent = true }
    },
  }
}

M.telescope = {
  n = {
    ['<space>ff'] = {
      require('telescope.builtin').find_files,
      'telescope find files'
    },
    ['<space>fg'] = {
      require('telescope.builtin').live_grep,
      'telescope livm grep'
    },
    ['<space>fb'] = {
      require('telescope.builtin').buffers,
      'telescope buffers'
    },
    ['<space>fh'] = {
      require('telescope.builtin').help_tags,
      'telescope help tags'
    },
  }
}


M.lspconfig = {
  n = {
    ['gd'] = {
      function ()
        vim.lsp.buf.definition()
      end,
      'lsp goto definition',
    },
    ['K'] = {
      function ()
        vim.lsp.buf.hover()
      end,
      'lsp hover'
    },
    ['[d'] = {
      function ()
        vim.diagnostic.goto_prev({})
      end,
      'lsp diagnostic goto prev'
    },
    [']d'] = {
      function ()
        vim.diagnostic.goto_next()
      end,
      'lsp diagnostic goto next'
    },
    ['<space>fm'] = {
      function ()
        vim.lsp.buf.format{ async = true }
      end,
      'lsp format'
    },
    ['<space>f'] = {
      function ()
        vim.diagnostic.open_float()
      end,
      'lsp diagnostic open float'
    }
  }
}

M.persistence = {
  n = {
    ['<space>qs'] = {
      function ()
        require('persistence').load()
      end,
      'session persistence manager load'
    },
    ['<space>ql'] = {
      function ()
        require('persistence').load({ lst = true })
      end,
    },
    ['<space>qd'] = {
      function ()
        require('persistence').stop()
      end,
      "stop Persistence"
    }
  }
}


return M
