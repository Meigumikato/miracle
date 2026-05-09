local map = vim.keymap.set

-- Move lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor centered
map("n", "J", "mzJ`z", { desc = "Join lines (keep cursor)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })

-- Delete/change into void register
map({ "n", "x" }, "<leader>d", '"_d', { desc = "Delete (no register)" })
map("x", "<leader>p", '"_dP', { desc = "Paste over (keep register)" })

-- Quick save
map({ "n", "i", "x", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Better escape
map("i", "jk", "<Esc>", { desc = "Escape insert mode" })

-- Quickfix navigation
map("n", "[q", "<cmd>cprev<cr>zz", { desc = "Prev quickfix" })
map("n", "]q", "<cmd>cnext<cr>zz", { desc = "Next quickfix" })

-- Window management
map("n", "<leader>wm", "<C-w>|<C-w>_", { desc = "Maximize window" })
map("n", "<leader>we", "<C-w>=", { desc = "Equalize windows" })
