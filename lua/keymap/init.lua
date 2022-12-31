local M = {}

M.nmap = {
  ['<C-h>'] = { '<C-w>h', "switch to left", noremap = true, silent = true },
  ['<C-l>'] = { '<C-w>l', "switch to right", noremap = true, silent = true },
  ['<C-j>'] = { '<C-w>j', "switch to down", noremap = true, silent = true },
  ['<C-k>'] = { '<C-w>k', "switch to up", noremap = true, silent = true },

  -- ['gd'] = { '<cmd>Lspsaga peek_definition<cr>', "peek definition", silent = true },
  -- ["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "next diagnostics", silent = true },
  -- ["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "prev diagnostics", silent = true },

  -- ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "hover doc", silent = true },
  ["<leader>"] = {
    b = {
      name = "+buffer",
      l = { "<cmd>BufferLineCycleNext<cr>", "Goto Next Buffer", silent = true },
      h = { "<cmd>BufferLineCyclePrev<cr>", "Goto Prev Buffer", silent = true },
      d = { "<cmd>bd<cr>", "Close Current Buffer", silent = true },
      s = { "<cmd>BufferLinePick<cr>", "Pick Buffer", silent = true },
      p = { "<cmd>BufferLineTogglePin<cr>", "Pin Current Buffer", silent = true },
    },

    c = {
      name = "+code",
      a = { "<cmd>Lspsaga code_action<CR>", "Code Action", silent = true },
    },

    f = {
      name = "+find",
      f = { "<cmd>Telescope find_files<cr>", "find files", noremap = true, silent = true },
      g = { "<cmd>Telescope live_grep<cr>", "live grep", noremap = true, silent = true },
      b = { "<cmd>Telescope buffers<cr>", "find buffers", noremap = true, silent = true },
      h = { "<cmd>Telescope help_tags<cr>", "find help tags", noremap = true, silent = true },
      d = { "<cmd>Telescope file_browser<cr>", "file_browser", noremap = true, silent = true },
    },
    o = {
      name = "+open",
      e = { "<cmd>NvimTreeToggle<cr>", "toggle nvimtree" },
      -- t = { "<cmd>Lspsaga open_floaterm<CR>", "open floaterm", silent = true },
      -- g = { "<cmd>Lspsaga open_floaterm lazygit<CR>", "open lazygit", silent = true },
    },

    h = {
      name = "+help",
      r = {
        name = "+update",
        r = {
          "<cmd>Lazy<cr>", "lazy"
        },
      },
      k = { "<cmd>Legendary keymaps<cr>", "search keymaps", silent = true },
    },
    m = {
      name = "+lsp mode",
      -- r = { '<cmd>Lspsaga rename<cr>', "lsp rename", silent = true },
      o = { "<cmd>SymbolsOutline<cr>", "code outline", silent = true },
      d = {
        name = "+lsp diagnostics",
        -- c = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "lsp cursor diagnostics", silent = true },
        -- l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "lsp line diagnostics", silent = true },
      }
    }
  },
}

M.tmap = {
  -- ["<A-d>"] = { [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], "toggle nvimtree", mode = "t", silent = true },
}


return M
