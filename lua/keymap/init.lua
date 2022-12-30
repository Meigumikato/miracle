local M = {}

M.nmap = {
  ['<C-h>'] = { '<C-w>h', "switch to left", noremap = true, silent = true },
  ['<C-l>'] = { '<C-w>l', "switch to right", noremap = true, silent = true },
  ['<C-j>'] = { '<C-w>j', "switch to down", noremap = true, silent = true },
  ['<C-k>'] = { '<C-w>k', "switch to up", noremap = true, silent = true },

  ['gd'] = { '<cmd>Lspsaga peek_definition<cr>', "peek definition", silent = true },
  ["[e"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "next diagnostics", silent = true },
  ["e]"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "prev diagnostics", silent = true },

  ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "hover doc", silent = true },
  ["<leader>"] = {
    b = {
      name = "+buffer",
      l = { "<cmd>BufferLineCycleNext<cr>", "Goto Next Buffer" },
      h = { "<cmd>BufferLineCyclePrev<cr>", "Goto Prev Buffer" },
      d = { "<cmd>bd<cr>", "Close Current Buffer" },
      s = { "<cmd>BufferLinePick<cr>", "Pick Buffer" },
      p = { "<cmd>BufferLineTogglePin<cr>", "Pin Current Buffer" },
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
      e = { "<cmd>NvimTreeToggle<cr>", "toggle nvimtree" }
    },

    h = {
      name = "+help",
      r = {
        name = "+update",
        r = {
          "<cmd>Lazy<cr>", "lazy"
        },
      },
    },
    m = {
      name = "+lsp mode",
      r = { '<cmd>Lspsaga rename<cr>', "lsp rename", silent = true },
      o = { "<cmd>LSoutlineToggle<CR>", "lsp outline", silent = true },
      d = {
        name = "+lsp diagnostics",
        c = { "<cmd>Lspsaga show_cursor_diagnostics<CR>", "lsp cursor diagnostics", silent = true },
        l = { "<cmd>Lspsaga show_line_diagnostics<CR>", "lsp line diagnostics", silent = true },
      }
    }
  },
}

return M
