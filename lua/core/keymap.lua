local M = {}

M.basic = {
  n = {
    ['<C-h>'] = { '<C-w>h', "switch to left" , opts = { noremap = true, silent = true } },
    ['<C-l>'] = { '<C-w>l', "switch to right", opts = { noremap = true, silent = true } },
    ['<C-j>'] = { '<C-w>j', "switch to down" , opts = { noremap = true, silent = true } },
    ['<C-k>'] = { '<C-w>k', "switch to up"   , opts = { noremap = true, silent = true } },

    -- ['<space>bd'] = { '<CMD>bd<CR>', 'close buffer', opts = { noremap = true, silent = true } },
    -- ['<space>bn'] = { '<CMD>BufferLineCycleNext<CR>', "goto next buffer", opts = { noremap = true, silent = true }},
    -- ['<space>bp'] = { '<CMD>BufferLineCyclePrev<CR>', "goto prev buffer", opts = { noremap = true, silent = true }},

    -- ['<space>bn'] = { '<CMD>bd<CR>', 'close buffer', opts = { noremap = true, silent = true } },

    -- ["<space>hrr"] = { "<CMD>PackerSync<CR>", "PackeSync Plugins", opts = { noremap = true, silent = true }},

  }
}

M.nvimtree = {
  plugin = true,
  n = {
    -- toggle
    -- ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },

    -- focus
    -- ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
  }
}

M.bufferline = {
  plugin = true,
  n = {
    -- ['<TAB>'] = {
    --   '<CMD> BufferLineCycleNext <CR>',
    --   'switch to next buffer',
    --   opts = { noremap = true, silent = true }
    -- },
    -- ['<S-TAB>'] = {
    --   '<CMD> BufferLineCyclePrev <CR>',
    --   'switch to prev buffer',
    --   opts = { noremap = true, silent = true }
    -- },
  }
}

M.telescope = {
  plugin = true,
  n = {
    ["<space>ff"] = {
      "<cmd> Telescope find_files <CR>",
      "find files" },
    ["<space>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    ["<space>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<space>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<space>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    ["<space>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    ["<space>tk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },
  }
}


M.lspconfig = {
  plugin = true,
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

-- M.persistence = {
--   plugin = true,
--   n = {
--     ['<space>qs'] = {
--       function ()
--         require('persistence').load()
--       end,
--       'session persistence manager load'
--     },
--     ['<space>ql'] = {
--       function ()
--         require('persistence').load({ lst = true })
--       end,
--     },
--     ['<space>qd'] = {
--       function ()
--         require('persistence').stop()
--       end,
--       "stop Persistence"
--     }
--   }
-- }

return M
