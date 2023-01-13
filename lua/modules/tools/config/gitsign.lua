require("gitsigns").setup({
	on_attach = function(bufnr)
		local function map(mode, lhs, rhs, opts)
			opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
			vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
		end

		-- Navigation
		map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
		map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

		-- Actions
		map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "git stage_hunk" })
		map("v", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", { desc = "git stage_hunk" })
		map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "git reset_hunk" })
		map("v", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", { desc = "git reset_hunk" })
		map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>", { desc = "git stage_buffer" })
		map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>", { desc = "git undo_stage_hunk" })
		map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>", { desc = "git reset_buffer" })
		map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "git preview_hunk" })
		map("n", "<leader>gba", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', { desc = "git blame" })
		map("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "git blame line" })
		-- map('n', '<leader>gd', '<cmd>Gitsigns diffthis<CR>', { desc = 'git diff' })
		-- map('n', '<leader>gD', '<cmd>lua require"gitsigns".diffthis("~")<CR>', { desc = 'git diffthis' })
		map("n", "<leader>gx", "<cmd>Gitsigns toggle_deleted<CR>")

		-- Text object
		map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "text-obj select_hunk" })
		map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "text-obj select_hunk" })
	end,
})
