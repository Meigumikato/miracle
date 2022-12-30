local M = {}

local wk = require("which-key")

    -- ['<space>bd'] = { '<CMD>bd<CR>', 'close buffer', opts = { noremap = true, silent = true } },
    -- ['<space>bn'] = { '<CMD>BufferLineCycleNext<CR>', "goto next buffer", opts = { noremap = true, silent = true }},
    -- ['<space>bp'] = { '<CMD>BufferLineCyclePrev<CR>', "goto prev buffer", opts = { noremap = true, silent = true }},

    -- ['<space>bn'] = { '<CMD>bd<CR>', 'close buffer', opts = { noremap = true, silent = true } },

    -- ["<space>hrr"] = { "<CMD>PackerSync<CR>", "PackeSync Plugins", opts = { noremap = true, silent = true }},

wk.register({
  ["<leader>"] = {
    b = {
      name = "+buffer",
      l = { "<cmd>BufferLineCycleNext<cr>", "Goto Next Buffer" },
      h = { "<cmd>BufferLineCyclePrev<cr>", "Goto Prev Buffer" },
      d = { "<cmd>bd<cr>", "Close Current Buffer" },
      s = { "<cmd>BufferLinePick<cr>", "Pick Buffer" },
      p = { "<cmd>BufferLineTogglePin<cr>", "Pin Current Buffer"},
    },

    f = {
      name = "+find",
      f = { "<cmd>Telescope find_files<cr>", "find files", noremap = true, silent = true },
      g = { "<cmd>Telescope live_grep<cr>", "live grep", noremap = true, silent = true },
      b = { "<cmd>Telescope buffers<cr>", "find buffers", noremap = true, silent = true  },
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
          "<cmd>PackerSync<cr>", "PackerSync"
        },
      },
      k = {
        "<cmd>legendary<cr>", "Search KeyMap Desc"
      }
    }
  },
})

-- wk.setup()

return M
