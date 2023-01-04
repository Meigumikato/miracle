local M = {}

M.bufferline = {
  { '<leader>bl', "<cmd>BufferLineCycleNext<cr>", desc = "Goto Next Buffer"},
  { '<leader>bh', "<cmd>BufferLineCyclePrev<cr>", desc = "Goto Prev Buffer"},
	{ '<leader>bd', "<cmd>bd<cr>", desc = "Close Current Buffer" },
  { '<leader>bp', "<cmd>BufferLinePick<cr>", desc = "Pick Buffer"},
	{ '<leader>bf',  "<cmd>BufferLineTogglePin<cr>", desc = "Pin Current Buffer"},
}


M.nvimtree = {
  { "<leader>oe", "<cmd>NvimTreeToggle<cr>", desc = "toggle nvimtree" },
}

return M
