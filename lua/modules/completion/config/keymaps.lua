local M = {}

function M.on_attach(_client, bufnr)

  local function map(lhs, rhs, opts)
    opts = opts or {}
    vim.keymap.set(
      opts.mode or "n",
      lhs,
      type(rhs) == "string" and ("<cmd>%s<cr>"):format(rhs) or rhs,
      { noremap = true, silent = true, buffer = bufnr, expr = opts.expr, desc = opts.desc }
    )
  end

	map("gd", "Telescope lsp_definitions", { desc = "Goto Definition" })
	map("gp", "Lspsaga peek_definition", { desc = "Peek Definition" })
	map("gr", "Telescope lsp_references", { desc = "References" })
	map("gD", "Telescope lsp_type_definitions", { desc = "Goto Declaration" })
	map("gI", "Telescope lsp_implementations", { desc = "Goto Implementation" })
	map("gK", vim.lsp.buf.signature_help, { desc = "Signature Help" })

	map("<leader>clr", "Lspsaga rename", { desc = "LSP Rename", mode = { "n", "v" } })
	map("<leader>cla", "Lspsaga code_action", { desc = "LSP CodeAction", mode = { "n", "v" } })
	map("<leader>clf", "Lspsaga lsp_finder", { desc = "LSP Finder" })

	map("<leader>cdc", "Lspsaga show_cursor_diagnostics", { desc = "Cursor Diagnostics" })
	map("<leader>cdl", "Lspsaga show_line_diagnostics", { desc = "Cursor Diagnostics" })
	map("<leader>cdt", "Telescope diagnostics", { desc = "Telescope Diagnostics" })

	map("<leader>mdr", "Telescope lsp_references", { desc = "Trouble References" })
	map("<leader>cli", "Telescope lsp_implementations", { desc = "Goto Implementation" })
	map("<leader>clt", "Telescope lsp_type_definitions", { desc = "Goto Type Definition" })


	map("[d", "Lspsaga diagnostic_jump_next", { desc = "Goto Next Diagnostic" })
	map("]d", "Lspsaga diagnostic_jump_prev", { desc = "Goto Prev Diagnostic" })

	map("[e", function()
		require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, { desc = "Goto Next ERR" })

	map("]e", function()
		require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, { desc = "Goto Next ERR" })

	map("[w", function()
		require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.WARN })
	end, { desc = "Goto Next WARN" })

	map("]w", function()
		require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.WARN })
	end, { desc = "Goto Next WARN" })
end


return M
