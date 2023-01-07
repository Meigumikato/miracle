local icons = require("core.icons")

local diagnostics_signs = {
	Error = icons.diagnostics.BoldError,
	Warn = icons.diagnostics.BoldWarning,
	Hint = icons.diagnostics.BoldHint,
	Info = icons.diagnostics.BoldInformation,
}

local function map(lhs, rhs, opts)
	opts = opts or {}
	vim.keymap.set(
		opts.mode or "n",
		lhs,
		type(rhs) == "string" and ("<cmd>%s<cr>"):format(rhs) or rhs,
		{ silent = true, buffer = opts.buffer, expr = opts.expr, desc = opts.desc }
	)
end

local function format()
	local buf = vim.api.nvim_get_current_buf()
	local ft = vim.bo[buf].filetype
	local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0
	vim.lsp.buf.format({
		bufnr = buf,
		filter = function(client)
			if have_nls then
				return client.name == "null-ls"
			end
			return client.name ~= "null-ls"
		end,
		async = true,
	})
end

local function common_on_attach(client, bufnr)
	-- local opts = { noremap = true, silent = true, buffer = bufnr, mode = { "n" } }
	local cap = client.server_capabilities

	-- a = { "<cmd>Lspsaga code_action<CR>", "Code Action", opts },
	map("<leader>cla", "Lspsaga code_action", { desc = "LSP CodeAction", mode = { "n", "v" } })
	map("<leader>clf", "Lspsaga lsp_finder", { desc = "LSP Rename" })

	map("<leader>cdc", "Lspsaga show_cursor_diagnostics", { desc = "Cursor Diagnostics" })
	map("<leader>cdl", "Lspsaga show_line_diagnostics", { desc = "Cursor Diagnostics" })
	map("<leader>cdt", "Telescope diagnostics", { desc = "Telescope Diagnostics" })

	map("<leader>mdr", "Trouble lsp_references", { desc = "Trouble References" })
	map("<leader>cli", "Telescope lsp_implementations", { desc = "Goto Implementation" })
	map("<leader>clt", "Telescope lsp_type_definitions", { desc = "Goto Type Definition" })

	map("gd", "Trouble lsp_definitions", { desc = "Goto Definition" })
	map("gp", "Lspsaga peek_definition", { desc = "Peek Definition" })
	map("gr", "Trouble lsp_references", { desc = "References" })
	map("gD", "Telescope lsp_type_definitions", { desc = "Goto Declaration" })
	map("<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help", mode = { "i", "n" } })
	map("K", "Lspsaga hover_doc", { desc = "Hover" })
	map("[d", "Lspsaga diagnostic_jump_next", { desc = "Next Diagnostic" })
	map("]d", "Lspsaga diagnostic_jump_prev", { desc = "Prev Diagnostic" })

  map("[e",
    function()
      require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
    end, { desc = "Next Error" })

  map("]e",
    function()
      require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
    end, { desc = "Next Error" })

  map("[w",
    function()
      require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.WARN })
    end, { desc = "Next Warning" })

  map("]w",
    function()
      require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.WARN })
    end, { desc = "Next Warning" })
	-- map("]e", M.diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
	-- map("[e", M.diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
	-- map("]w", M.diagnostic_goto(true, "WARNING"), { desc = "Next Warning" })
	-- map("[w", M.diagnostic_goto(false, "WARNING"), { desc = "Prev Warning" })

	if cap.documentFormattingProvider then
		map("<leader>cm", format, { desc = "Format Document" })
    if client.name == "gopls" then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("LspFormat." .. bufnr, {}),
        buffer = bufnr,
        callback = function()
            format()
        end
      })
    end
	end

	if cap.documentRangeFormattingProvider then
		map("<leader>cm", format, { desc = "Format Range", mode = "v" })
	end

	if cap.renameProvider then
		map("<leader>clr", "Lspsaga rename", { desc = "LSP Rename" })
	end

  -- vim.notify(client.name, vim.log.levels.INFO)

	require("lsp_signature").on_attach({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		handler_opts = {
			border = "rounded",
		},
		-- fix_pos = function(signatures, _)
		-- 	-- if signatures[1] and signatures[1].activeParameter <= 1 then
		-- 	-- 	return false
  --  --    else
  --  --      return true
		-- 	-- end
  --     return false
		-- end,
	}, bufnr)
end

local function common_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

local function config()
	for type, icon in pairs(diagnostics_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = false,
	})

	local lang = require("modules.lang")
	lang.on_attach = common_on_attach
	lang.capabilities = common_capabilities()

	require("modules.lang").setup()
end

return config
