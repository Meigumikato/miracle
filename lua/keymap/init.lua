local M = {}

local opts = {
  noremap = true,
  silent = true,
}

M.nmap = {
  ['<C-h>'] = { '<C-w>h', "switch to left", opts },
  ['<C-l>'] = { '<C-w>l', "switch to right", opts },
  ['<C-j>'] = { '<C-w>j', "switch to down", opts },
  ['<C-k>'] = { '<C-w>k', "switch to up", opts },

  -- ['gp'] = { '<cmd>Lspsaga peek_definition<cr>', "peek definition", opts },
  -- ["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "diagnostic_jump_prev", opts },
  -- ["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "diagnostic_jump_next", opts },

  -- ["K"] = { "<cmd>Lspsaga hover_doc<CR>", "hover doc", opts },
  ["<leader>"] = {
    b = {
      name = "+buffer",
      l = { "<cmd>BufferLineCycleNext<cr>", "Goto Next Buffer", opts },
      h = { "<cmd>BufferLineCyclePrev<cr>", "Goto Prev Buffer", opts },
      d = { "<cmd>bd<cr>", "Close Current Buffer", opts },
      s = { "<cmd>BufferLinePick<cr>", "Pick Buffer", opts },
      p = { "<cmd>BufferLineTogglePin<cr>", "Pin Current Buffer", opts },
    },

    c = {
      name = "+code",
      -- a = { "<cmd>Lspsaga code_action<CR>", "Code Action", opts },
      -- f = { function() vim.lsp.buf.format { async = true } end, "Code Format", opts },
    },

    f = {
      name = "+find",
      f = { "<cmd>Telescope find_files<cr>", "find files", opts },
      g = { "<cmd>Telescope live_grep<cr>", "live grep", opts },
      b = { "<cmd>Telescope buffers<cr>", "find buffers", opts },
      h = { "<cmd>Telescope help_tags<cr>", "find help tags", opts },
      d = { "<cmd>Telescope file_browser<cr>", "file_browser", opts },
    },
    g = {
      name = "git",
      d = {
        name = 'diff view',
        d = { '<cmd>DiffviewOpen<cr>', 'open diffview', opts },
        x = { '<cmd>DiffviewClose<cr>', 'close diffview', opts }
      }
    },
    o = {
      name = "+open",
      e = { "<cmd>NvimTreeToggle<cr>", "toggle nvimtree" },
      t = { "<cmd>Lspsaga open_floaterm<CR>", "open floaterm", opts },
      g = { "<cmd>Lspsaga open_floaterm lazygit<CR>", "open lazygit", opts },
    },

    h = {
      name = "+help",
      r = {
        name = "+update",
        r = {
          "<cmd>Lazy<cr>", "lazy"
        },
      },
      k = { "<cmd>Legendary keymaps<cr>", "search keymaps", opts },
    },
    m = {
      name = "+lsp mode",
      -- f = { "<cmd>Lspsaga lsp_finder<CR>", 'Lspsaga finder', opts },
      -- r = { '<cmd>Lspsaga rename<cr>', "lsp rename", opts },
      o = { "<cmd>SymbolsOutline<cr>", "code outline", opts },
      i = {
        name = "Mode Info",
        l = {'<cmd>LspInfo<cr>', "LSP Info", opts},
        n = {'<cmd>NullLsInfo<cr>', "Null-ls Info", opts}
      },
      d = {
        name = "+lsp diagnostics",
        -- c = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "lsp cursor diagnostics", opts },
        -- l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "lsp line diagnostics", opts },
        -- Lua
        t = { "<cmd>TroubleToggle<cr>", 'TroubleToggle', opts },
        w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics", opts },
        d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics", opts },
        o = { "<cmd>TroubleToggle loclist<cr>", "Trouble Loclist", opts },
      }
    }
  },
}

M.tmap = {
  ["<A-d>"] = { [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], "toggle nvimtree", mode = "t", silent = true },
}


return M
